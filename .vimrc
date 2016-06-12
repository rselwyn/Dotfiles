"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""VUNDLE AND PLUGINS """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
" Plugin 'valloric/youcompleteme'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" VIM SETTINGS """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"turn on syntax highlighting
syntax enable 

" Color theme
set background=dark
colorscheme gruvbox
" colorscheme molokai

" Line Numbering
set number 

" Show matching brackets.
set showmatch

" Auto Indent
set autoindent

" Font
set guifont=Menlo\ for\ Powerline

set nocompatible

" Show Ruler
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"get rid of swap file bs
set noswapfile
set nobackup
set nowb

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Vertical Movement Speed
set so=5

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Auto Indent, Smart Indent, Wrap Line
set ai 
set si 
set wrap 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" PLUGIN CONFIGS"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntastic

let g:syntastic_check_on_open = 0

" Turn on vim airline and configure it

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
set laststatus=2

" NERDTree Open on Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Automatically open NERDTree

if has("gui_macvim")
	" MacVim only stuff
	autocmd vimenter * NERDTree
endif

" Gruvbox Color


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" COMMANDS + OTHER """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast close
nmap <leader>q :q<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>m :tabnext<cr>

" Mapping for moving windows
map <leader>wu <C-w>k<cr>
map <leader>wd <C-w>j<cr>
