# specify oh-my-zsh home directory
export ZSH="$HOME/.oh-my-zsh"

# specify oh-my-zsh theme
ZSH_THEME="devcontainers"

# specify zsh custom plugin directory
ZSH_CUSTOM=$ZSH/custom

# list plugins to be used
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

# add key bindings for zsh-history-substring-search plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# source oh-my-zsh.sh main script
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# add kubectl completion
source <(kubectl completion zsh)
complete -o default -F __start_kubectl k
kubectl completion zsh > "${fpath[1]}/_kubectl"

# add zsh completion
command -v flux >/dev/null && . <(flux completion zsh)

# add aliases
alias c="clear"
alias e="exit"
alias k="kubectl"
alias kn="kubens"
alias f="flux"
alias cg="lazygit"

# add custom hooks for tools
eval "$(direnv hook zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# load zsh plugins
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
