#!/usr/bin/env bash

function main() {

    local project_name="{{cookiecutter.project_name}}"

    case $1 in
    "test")
        (python -m unittest discover ./$project_name)
        ;;
    "lint")
        (flake8 $project_name)
        ;;

    "fix")
        (autopep8 -r --in-place -aaa --verbose $project_name)
        ;;
    "init")
        virtualenv -p python3 venv
        . venv/bin/ativate
        pip install -r requirements.txt
        ;;
    *)
        echo "Not a valid method."
        ;;
    esac
}

main "$@"
