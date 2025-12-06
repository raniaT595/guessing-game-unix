#!/usr/bin/env bash
# guessinggame.sh

function count_files {
    echo $(ls -A1 | wc -l)
}

function guessing_game {
    local files_count=$(count_files)
    local guess
    local guessed=false

    echo "Devinez combien de fichiers se trouvent dans le répertoire actuel."

    while [[ $guessed == false ]]; do
        read -p "Votre estimation : " guess

        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Veuillez entrer un nombre valide."
        elif [[ $guess -lt $files_count ]]; then
            echo "Votre estimation est trop basse. Essayez encore !"
        elif [[ $guess -gt $files_count ]]; then
            echo "Votre estimation est trop haute. Essayez encore !"
        else
            guessed=true
            echo "Félicitations ! Il y a bien $files_count fichiers dans ce répertoire."
        fi
    done
}

guessing_game
