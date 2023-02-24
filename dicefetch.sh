#!/bin/bash

# randomizing dices
number=$(seq 1 6 | sort -R | head -n 1)

# sysinfo
os=$(cat /etc/*release | grep "DESCRIPTION" | cut -c21-40 | tr -d '"')
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
disk=$(df -h /dev/sda6 | grep sda6 | awk {'print $3 " / " $2 " (" $5 ")"'})
memory=$(free -m | awk 'NR==2{printf "%sMB / %sMB (%.2f%%)\n", $3,$2,$3*100/$2}')

# dices
line1="┌───────┐"
line5="└───────┘"

if [ "$number" = "1" ];then
	line2="│       │"
	line3="│   •   │"
	line4="│       │"
fi
 
if [ "$number" = "2" ];then
	line2="│ •     │"
	line3="│       │"
	line4="│     • │"
fi 

if [ "$number" = "3" ];then
	line2="│ •     │"
	line3="│   •   │"
	line4="│     • │" 
fi

if [ "$number" = "4" ];then
	line2="│ •   • │"
	line3="│       │"
	line4="│ •   • │"
fi

if [ "$number" = "5" ];then
	line2="│ •   • │"
	line3="│   •   │"
	line4="│ •   • │"
fi

if [ "$number" = "6" ];then
	line2="│ •   • │"
	line3="│ •   • │"
	line4="│ •   • │"
fi

# output
cat <<EOF
 $line1	OS: $os
 $line2	KE: $kernel
 $line3	UP: $uptime
 $line4	RM: $memory
 $line5	HD: $disk
EOF
