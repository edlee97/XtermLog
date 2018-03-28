#!/usr/bin/env bash

cd
foldata () {
    if [[ ! -d "$1" ]]; then
        mkdir $1
    fi
}
if [[ ! -d "screen" ]]; then
    mkdir screen
fi
cd screen
declare -a folds=(c00 c01 c02 c03 c04 c05 c06 c07 c08 c09)
for i in ${folds[@]}
do
    foldata $i
done
for i in ${folds[@]}
do
    if [[ ! -e "$i.txt" ]]; then
        touch "$i.txt"
        cd $i
        f="$i"
        break
    fi
    if [[ $i == "c09" ]]; then
        notify-send "All folders are currently in use. Exiting now."
        exit 1
    fi
done
x-terminal-emulator -e screen -L -S $i
cd ..
rm $f.txt
echo 'Script has ran correctly. Have a nice day.'
/root/logger.py
