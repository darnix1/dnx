#!/bin/bash
clear
# color fun
grs="\033[1;93m"
bg="\033[42m"
gr="\033[1;32m"
gry="\033[1;37m"
NC='\033[0m'

# function bar animasi
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne " ${grs}Actualizando ${gry}- ${grs}["
    while true; do
        for ((i = 0; i < 11; i++)); do
            echo -ne "${gr}➣ "
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "${grs}]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne " ${grs}Actualizando ${gry}- ${grs}["
    done
    echo -e "${grs}]${gry} - ${gr}Ok !${gry}"
    tput cnorm
}
res1() {
    wget https://raw.githubusercontent.com/darnix1/dnx/main/menu/menu.zip
    unzip menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin/
    #unzip menu.zip
    #chmod +x menu/*
    #mv menu/* /usr/local/sbin
    rm -rf menu menu.zip
    rm -rf update.sh
    wget -qO- fv-tunnel "https://raw.githubusercontent.com/darnix1/dnx/main/config/fv-tunnel" 
    chmod +x fv-tunnel 
    bash fv-tunnel
    rm -rf fv-tunnel
}
netfilter-persistent
clear
echo -e "\e[38;5;239m════════════════════════════════════════════════════"
echo -e "         \033[45m \033[103m \033[107m\033[30m SCRIPT DARNIX OPTIMIZADO \033[103m \033[45m \e[0m"
echo -e ""
echo -e "\033[38;5;239m════════════════\e[48;5;1m\e[38;5;230m  ACTUALIZAR  \e[0m\e[38;5;239m════════════════════"
echo -e ""
echo -e "${bg}              UPDATE SCRIPT               ${NC}"
echo -e "${grs}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e " ${gr}UPDATING SCRIPT PREMIUM${NC}"
fun_bar 'res1'
echo -e "${grs}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
sleep 3
menu

