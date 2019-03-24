set nocompatible

let mapleader = ","
let g:mapleader = ","

set history=100
set hlsearch
set backspace=indent,eol,start
set go-=T
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround
set showmatch
set autoindent
set number
set autoread
set clipboard=unnamedplus
set guifont=UbuntuMono

autocmd BufWritePre * :%s/\s\+$//e

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


set rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup


" Vundle config
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

syntax on

" Change d commands to not affect buffers unless prefixed with leader
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" Sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
