# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' format 'Completion type: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit -u

source ~/dev/waypoints/waypoints.zsh
fpath=(~/.zsh-completions ~/dev/waypoints ~/sw/zsh-completions $fpath)

autoload -Uz compinit
compinit

for f in ~/.{functions,aliases}.zsh; do
	source "$f"
done

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

setopt appendhistory autocd
setopt inc_append_history
setopt transient_rprompt
setopt print_exit_value

unsetopt beep
unsetopt ignoreeof

autoload -U colors
colors

bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del

export EDITOR=nvim

if [[ -d $HOME/dev/go ]]; then
	export GOPATH=~/dev/go
	export PATH="$GOPATH/bin:$PATH"
fi

if [[ -d $HOME/.cargo ]]; then
	export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -d $HOME/bin ]]; then
	export PATH="$HOME/bin:$PATH"
fi

if [[ -d $HOME/sw/zsh-syntax-highlighting ]]; then
	source ~/sw/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# NVM and RVM make startup really slow
# 0.05s -> 0.41s

# if [[ -d ~/.nvm ]]; then
# 	export NVM_DIR=~/.nvm
# 	if brew > /dev/null 2>/dev/null; then
# 		source $(brew --prefix nvm)/nvm.sh
# 	fi
# fi

# if [[ -d ~/.rvm ]]; then
# 	source ~/.rvm/scripts/rvm
# 	export PATH="$PATH:$HOME/.rvm/bin"
# fi

export PAGER=/usr/bin/less
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode – bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan
