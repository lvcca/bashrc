#!/bin/bash

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return;
fi

declare -a text_colors
text_colors=( $((RANDOM % 249)) $((RANDOM % 249)) $((RANDOM % 249)) $((RANDOM % 249)) $((RANDOM % 249)) $((RANDOM % 249)) )

#PS1='[\h :\W \u\$]'

PS1=''
PS1+='\[$(tput bold)\]\n';
PS1+='\[$(tput setaf ${text_colors[0]})\]{'; #191 FIRST
PS1+='\[$(tput setaf ${text_colors[1]})\]\u'; #115 SECOND
PS1+='\[$(tput setaf ${text_colors[4]})\]@'; # FIFTH
PS1+='\[$(tput setaf ${text_colors[0]})\]('; #191 FIRST
PS1+='\[$(tput setaf ${text_colors[2]})\]\W'; #THIRD
PS1+='\[$(tput setaf ${text_colors[0]})\])'; #191 FIRST
PS1+='\[$(tput setaf ${text_colors[4]})\]['; #034 FIFTH
PS1+='\[$(tput setaf 5)\]';
PS1+='\[$(tput setaf ${text_colors[3]})\]\@'; #247 FOURTH
PS1+='\[$(tput setaf ${text_colors[4]})\]]'; #034 FIFTH
PS1+='\[$(tput setaf ${text_colors[0]})\]}'; #191 FIRST
PS1+='\[$(tput setaf ${text_colors[5]})\]# '; #SIXTH
PS1+='\[$(tput sgr0)\]'

#Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

#export CLICOLOR=1
#export LSCOLORS=hxCxGxcxCxegedabagaced

LSCOLORS="exfxcxdxbxegedabagacad";
export LSCOLORS
export CLICOLOR=1

export GREP_OPTIONS='--color=auto'

#export LESS='-R'
#export LESSOPEN='|pygmentize -g %s'

alias ls='CLICOLOR_FORCE=1 ls -G'
alias less='less -R'

set -o emacs
