sws() {
    export workspace_path=$(pwd)
    echo $workspace_path

    export workspace_name=""
    while [[ $(pwd) != $HOME ]]; do
        if [[ -d ./venv ]] then
            . ./venv/bin/activate
            echo "Found .venv in $(pwd)"
            break
        fi
        cd ..
    done
    
    cd $workspace_path

    while [[ $(pwd) != $HOME ]]; do
        if [[ -f .env ]] then
            . ./.env
            echo "Found .env in $(pwd)"
            break
        fi
        cd ..
    done

    cd $workspace_path

    if [[ $workspace_name ]] then
        echo "Loading $workspace_name"
        export PROMPT="($workspace_name) $PROMPT"
    fi
}

chws() {
    cd ${WORKSPACE_DIR}/${1:-}
    sws
}

alias fmt="./scripts/dev-build/scripts/format.sh"
