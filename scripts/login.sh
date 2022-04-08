#!/bin/bash

discFreeSpace=`df -h | grep disk1s5s1 | awk '{print $4}' | tr -d '\n'`
memAvailable=`top -l 1 -s 0 | grep PhysMem`
cpuUsage=`ps -e -o %cpu | awk '{s+=$1} END {print s}'`
phpVersion=`php -v 2>&1 | head -n 1 | cut -c1-10`

printf "
⣠⣶⠿⠿⠿⠿⠿⠿⠿⠿⣷⣦⡀⣴⣶⠿⠿⠿⠿⠿⠿⠿⠿⣶⣄
⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉
⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣤⣤⣤⣤⣤⣤⣤⣤⣤⣀      $memAvailable
⣿⣿⠀⠀⠀⠀⠘⠛⠛⠛⢻⣿⡇⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿      $discFreeSpace         $cpuUsage
⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿      $phpVersion
⠙⠿⣶⣶⣶⣶⣶⣶⣶⣶⡿⠟⠁⠻⣿⣶⣤⣤⣤⣤⣤⣤⣶⣿⠟
" | lolcat --truecolor --seed=11 --spread=6

