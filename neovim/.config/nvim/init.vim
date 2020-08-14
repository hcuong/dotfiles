set nocompatible
filetype off
syntax on
filetype plugin indent on
filetype plugin on
let g:mapleader=","
set number
set ruler
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

set scrolloff=3
set backspace=indent,eol,start
set hidden
set ttyfast
set laststatus=2
set showmode
set showcmd
set cmdheight=2
set wildmenu
set wildmode=list:longest,full
set mouse=a

nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr>
map <silent> <leader><cr> :noh<cr>

nmap <leader>w :w!<cr>
command W w !sudo tee % > /dev/null

:imap jk <Esc>

set wildignore=*.o,*~,*/.git/*,*/.DS_Store
set nobackup
set nowb
set noswapfile

call plug#begin("~/.vim/plugged")
  Plug 'dracula/vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mg979/vim-visual-multi'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-commentary'

  Plug 'sheerun/vim-polyglot'
  Plug 'maxmellon/vim-jsx-pretty'

  Plug 'ms-jpq/chadtree', { 'branch': 'chad', 'do': ':UpdateRemotePlugins' }
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
  "fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
call plug#end()

colorscheme dracula

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

nnoremap <silent> <leader>j :FZF<cr>
nnoremap <silent> <leader>J :FZF ~<cr>

nnoremap <leader>v <cmd>CHADopen<cr>

map <leader>g :Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
