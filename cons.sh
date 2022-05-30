#!/bin/bash

if [ $# -lt 1 ]
	then
        echo "-----------------------"
	echo "Specify an argument!"
	echo "0 = disable"
	echo "1 = enable"
	echo "2 = see current status"
	echo "-----------------------"
	exit 2
fi

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

if [ $1 = "2" ]
then
	status="$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)"
        echo "-----------------------"
	echo "Conservation Mode Status: $status"
        echo "-----------------------"
elif [ $1 = "1" ] || [ $1 = "0" ]
then
	echo $1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode
        echo "-----------------------"
	echo "Conservation Mode set to $1"
        echo "-----------------------"
else
        echo "-----------------------"
	echo "Unknown Conservation Mode status"
        echo "-----------------------"
fi

