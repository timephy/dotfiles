#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
brew install xz
brew install watch
brew install bat
brew install bats-core
# brew install dockutil
# brew install fasd
brew install ffmpeg
# brew install grip
# brew install httpie
# brew install jq
# brew install lynx
# brew install mackup
# brew install nano
# brew install pandoc
# brew install peco
brew install psgrep
brew install python
# brew install shellcheck
# brew install stow
# brew install thefuck

# Install other useful binaries.
# brew install ack
#brew install exiv2
brew install git
brew install git-lfs
# brew install gs
brew install imagemagick
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rlwrap
brew install ssh-copy-id
brew install tree
# brew install vbindiff
# brew install zopfli

# Install casks
# brew install --cask dash2
brew install --cask docker
brew install --cask dropbox
brew install --cask firefox
# brew install --cask font-fira-code
# brew install --cask font-hack
# brew install --cask google-backup-and-sync
brew install --cask google-chrome
brew install --cask google-chrome-canary
# brew install --cask hammerspoon
# brew install --cask kaleidoscope
# brew install --cask maccy
# brew install --cask macdown
# brew install --cask postman
# brew install --cask raycast
brew install --cask slack
# brew install --cask sourcetree
brew install --cask spotify
brew install --cask virtualbox
brew install --cask visual-studio-code
brew install --cask vlc

# Remove outdated versions from the cellar.
brew cleanup
