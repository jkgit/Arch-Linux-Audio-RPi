#!/bin/bash

border()
{
    local title="| $1 |"
    local edge=${title//?/-}
    echo -e "${edge}\e[34m\n${title}\n${edge}"
    sleep 4
}

border 'Removing Linux Audio Tuning'

[[ -f /usr/bin/Sound.sh ]] && rm /usr/bin/Sound.sh
[[ -f /etc/sysctl.d/network-latency.conf ]] && rm /etc/sysctl.d/network-latency.conf
[[ -f /etc/security/limits.conf.bak ]] && mv /etc/security/limits.conf.bak /etc/security/limits.conf
[[ -f /etc/systemd/system/sound.service ]] && rm /etc/systemd/system/sound.service

#rm basic-install.sh

border 'Cleaning Up & Rebooting System'
sleep 3
rm remove.sh
reboot
