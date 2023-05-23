[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/Android/Sdk/platform-tools/:$HOME/Android/Sdk/emulator/

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto # update automatically without asking

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

export NVM_LAZY_LOAD=true

plugins=(git z zsh-autosuggestions dotenv zsh-vi-mode zsh-nvm zsh-syntax-highlighting)

plug "olrtg/zsh-fvm"

source $ZSH/oh-my-zsh.sh

# My environment variables

# ---

export pi="ubuntu@towelwatches.live"
export res="janh@10.10.10.168"
export aldprod="resadmin@52.142.210.110"
export alduat="resadmin@13.80.1.83"
export aldtest="resadmin@40.118.10.118"

# My aliases

alias emu28="emulator -avd "Pixel_4_XL_API_28" -writable-system"
alias emu31="emulator -avd "Pixel_6_Pro_API_31" -writable-system"

alias sshpi="ssh $pi"
alias sshres="ssh $res"
alias sshprod="ssh $aldprod"
alias sshuat="ssh $alduat"
alias sshtest="ssh $aldtest"

alias dockersock="sudo ln -s $HOME/.docker/desktop/docker.sock /var/run/docker.sock"

alias f="fvm flutter"
alias d="fvm dart"

# ---
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/home/aleksandr/.gvm/scripts/gvm" ]] && source "/home/aleksandr/.gvm/scripts/gvm"

# export QT_QPA_PLATFORM=wayland

## Add any commands which depend on conda here
lazy_conda_aliases=('python' 'conda')

load_conda() {
  for lazy_conda_alias in $lazy_conda_aliases; do
    unalias $lazy_conda_alias
  done

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/aleksandr/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "/home/aleksandr/anaconda3/etc/profile.d/conda.sh" ]; then
      . "/home/aleksandr/anaconda3/etc/profile.d/conda.sh"
    else
      export PATH="/home/aleksandr/anaconda3/bin:$PATH"
    fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<

  unfunction load_conda
}

for lazy_conda_alias in $lazy_conda_aliases; do
  alias $lazy_conda_alias="load_conda && $lazy_conda_alias"
done

gvm use go1.19.3 > /dev/null 2>&1
export GOBIN="$HOME/go/bin"
# conda activate car_classification > /dev/null 2>&1
