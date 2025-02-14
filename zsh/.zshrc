# load homebrew

if test -e /opt/homebrew/bin/brew; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi
export PATH="/usr/local/bin:$PATH"

# load zsh extensions

autoload -U colors && colors
autoload -Uz vcs_info
PROMPT='%F{green}%*%f:%F{blue}%~%f %% '

zstyle ':vcs_info:git:*' formats ' %K{black}%F{gren} branch: %K{green}%F{black} %b %k'
precmd() {
    vcs_info
}

# prompt customization

setopt PROMPT_SUBST
export PROMPT='%B%F{yellow}%/${vcs_info_msg_0_}%F{cyan} > %f%b'

# aliases

## general

alias ls="ls -G"
alias lsa="ls -aG"
alias lsal="ls -alG"
alias src="source $ZDOTDIR/.zshrc"

## git

alias gb="git branch"
alias gp="git pull origin mainline --rebase"
alias gs="git status"
alias gst="git stash"
alias gstl="git stash list"
alias gstp="git stash pop"

# load additional config - purposefully loads after to override these defaults

if test -e ~/.config/zsh/; then
    for zsh_config in ~/.config/zsh/*; do source $zsh_config; done;
fi
