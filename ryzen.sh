#!/bin/bash

# -------------------------
# Ryzen ASCII Logo Animation
# -------------------------
animate_ryzen_logo() {
  clear
  local logo=(
    "$$$$$$$\\ $$\\     $$\\ $$$$$$$$\\ $$$$$$$$\\ $$\\   $$\\ "
    "$$  __$$\\\\$$\\   $$  |\\____$$  |$$  _____|$$$\\  $$ |"
    "$$ |  $$ |\\$$\\ $$  /     $$  / $$ |      $$$$\\ $$ |"
    "$$$$$$$  | \\$$$$  /     $$  /  $$$$$\\    $$ $$\\$$ |"
    "$$  __$$<   \\$$  /     $$  /   $$  __|   $$ \\$$$$ |"
    "$$ |  $$ |   $$ |     $$  /    $$ |      $$ |\\$$$ |"
    "$$ |  $$ |   $$ |    $$$$$$$$\\ $$$$$$$$\\ $$ | \\$$ |"
    "\\__|  \\__|   \\__|    \\________|\\________|\\__|  \\__|"
    "                                                  "
    "                                                  "
    "                                                  "
  )
  for line in "${logo[@]}"; do
    echo -e "\e[1;36m$line\e[0m"
    sleep 0.1
  done
  echo -e "\n\e[1;33m🔧 Ryzen Launcher by Dulal | Bengali Server Hub\e[0m\n"
  sleep 0.5
}

# -------------------------
# Ryzen System Info
# -------------------------
system_info() {
  echo -e "\e[1;32m[+] Hostname:\e[0m $(hostname)"
  echo -e "\e[1;32m[+] OS:\e[0m $(lsb_release -d | cut -f2)"
  echo -e "\e[1;32m[+] Uptime:\e[0m $(uptime -p)"
  echo -e "\e[1;32m[+] Memory:\e[0m $(free -h | grep Mem | awk '{print $3 "/" $2}')"
  echo ""
}

# -------------------------
# Ryzen Service Setup
# -------------------------
setup_minecraft() {
  echo -e "\e[1;34m[+] Setting up Minecraft Server...\e[0m"
  mkdir -p ~/ryzen-mc
  cd ~/ryzen-mc
  wget https://launcher.mojang.com/v1/objects/e3c3f1e7/server.jar -O server.jar
  echo "eula=true" > eula.txt
  java -Xmx1G -Xms1G -jar server.jar nogui
}

setup_rdp() {
  echo -e "\e[1;34m[+] Installing RDP...\e[0m"
  sudo apt update
  sudo apt install xrdp xfce4 xfce4-goodies -y
  echo "startxfce4" > ~/.xsession
  sudo systemctl enable xrdp
  sudo systemctl start xrdp
}

setup_playit() {
  echo -e "\e[1;34m[+] Launching Playit Tunnel...\e[0m"
  wget https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-linux-amd64
  chmod +x playit-linux-amd64
  ./playit-linux-amd64
}

# -------------------------
# Ryzen Main Menu
# -------------------------
main_menu() {
  animate_ryzen_logo
  system_info
  echo -e "\e[1;36mSelect an option:\e[0m"
  echo "1) Setup Minecraft Server"
  echo "2) Setup RDP Access"
  echo "3) Launch Playit Tunnel"
  echo "4) Exit"
  read -p "Choice: " choice
  case $choice in
    1) setup_minecraft ;;
    2) setup_rdp ;;
    3) setup_playit ;;
    4) echo -e "\e[1;31mExiting Ryzen Launcher. Goodbye!\e[0m"; exit 0 ;;
    *) echo -e "\e[1;31mInvalid choice! Please select 1–4.\e[0m"; sleep 1; main_menu ;;
  esac
}

main_menu
