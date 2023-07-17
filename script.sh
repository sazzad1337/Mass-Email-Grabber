#!/bin/bash

output_file="webpage_data.txt"
email_file="emails.txt"
cookie="30f667c5865f5ea282d3f92e7d34e7b0"

# ASCII art title
echo -e "\e[1;31m
                                                                     
 _____                _____           _ _    _____         _   _           
|     |___ ___ ___   |   __|_____ ___|_| |  |   __|___ ___| |_| |_ ___ ___ 
| | | | .'|_ -|_ -|  |   __|     | .'| | |  |  |  |  _| .'| . | . | -_|  _|
|_|_|_|__,|___|___|  |_____|_|_|_|__,|_|_|  |_____|_| |__,|___|___|___|_|  
                                                                           
                                                        
\e[0m"


for ((i=1; i<=3; i++))
do
    url="https://example.com/adminpanel/user.php?page_no=$i"
    response=$(curl -s -b "PHPSESSID=$cookie" "$url")
    emails=$(echo "$response" | grep -Eio '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b')
    echo "$emails" >> "$email_file"
    echo "Fetched $url"
done

echo "Email addresses saved to $email_file"
