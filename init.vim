"=====================extentions====================
call plug#begin()


Plug 'tpope/vim-commentary'
Plug 'konpa/devicon'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf'
Plug 'dominikduda/vim_es7_javascript_react_snippets'
Plug 'voldikss/vim-floaterm'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'pacha/vem-tabline'
Plug 'tpope/vim-fugitive'
Plug 'psliwka/vim-smoothie'
Plug 'tyru/open-browser.vim'
Plug 'miyakogi/seiya.vim'
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'avneesh0612/react-nextjs-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()



"====================settings========================


set nocompatible
set number
set autoread
set history=1000
set nobackup
set wrap
set linebreak
set showbreak=...
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set completeopt+=longest
"set foldmethod=syntax
"set foldnestmax=10
"set foldlevel=1
set clipboard+=unnamed
set ttyfast
set laststatus=2
set so=7
set wildmenu
set hidden
set showcmd
set wildmode=list:longest
set scrolloff=3
set shell=$SHELL
set cmdheight=1
set title
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set visualbell
set t_vb=
set tm=500
set pastetoggle=<leader>v
set updatetime=300
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=UTF-8
"set nowrap

if has('mouse')
set mouse=a
" set ttymouse=xterm2
endif

if (empty($TMUX))
if (has("termguicolors"))
set termguicolors
endif
endif
if &term =~ '256color'
" disable background color erase
set t_ut=
endif
syntax on
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
colorscheme gruvbox

"===================configurations==================
let mapleader = '<space>'
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let 
let g:vem_tabline_multiwindow_mode = 1
let g:seiya_auto_enable=1

let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']

"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-emmet',
\ 'coc-css',
\ 'coc-html',
\ 'coc-git',
\ 'coc-json',
\ 'coc-tabnine',
\ 'coc-svelte',
\ '@yaegassy/coc-tailwindcss3',
\ 'coc-spell-checker',
\ 'coc-stylelint',
\ ]


let g:NERDTreeGitStatusIndicatorMapCustom = {
\ 'Modified'  :'✹',
\ 'Staged'    :'✚',
\ 'Untracked' :'✭',
\ 'Renamed'   :'➜',
\ 'Unmerged'  :'═',
\ 'Deleted'   :'✖',
\ 'Dirty'     :'✗',
\ 'Ignored'   :'☒',
\ 'Clean'     :'✔︎',
\ 'Unknown'   :'?',
\ }

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'typescript':['prettier'],
\ 'json':['prettier']
\}





let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'


let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '+'
let NERDTreeDirArrowCollapsible = '-'
"let NERDTreeQuitOnOpen=1
autocmd VimEnter * NERDTreeToggle
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q |endif

let g:floaterm_wintype='split'

let g:floaterm_height=0.2

let g:python3_host_prog='/bin/python3'
"===================key mappings====================
" wipout buffer
nmap <silent> <leader>b :bw<cr>

" shortcut to save
nmap <C-s> :w<cr>
imap <C-s> <esc> :w<cr>i

"close session
nmap <C-q> :q!<cr>

" toggle paste mode
nmap <leader>v :set paste!<cr>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>

" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>


" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
" nmap ;s :set invspell spelllang=en<cr>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

"Toggle NERDTree

inoremap <F5><esc> :NERDTreeToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Float term 

nnoremap <F6> :FloatermToggle<CR>
inoremap <F6><esc> :FloatermToggle<CR> i
nmap <f7> :FloatermNew<cr>



"swap lines or move lines
function! s:swap_lines(n1,n2)
  let  line1 = getline(a:n1)
  let line2 = getline(a:n2)
  
  call setline(a:n1,line2)
  call setline(a:n2,line1)
endfunction

function! s:swap_up()
  let n = line('.')
  if n ==1 
    return 
  endif

  call s:swap_lines(n,n-1)
  exec n - 1
endfunction

function! s:swap_down()
  let n = line('.')
  if n == line('$')
    return
  endif

  call s:swap_lines(n,n+1)
  exec n+1
endfunction

nnoremap <silent> <A-up> :call <SID>swap_up()<CR>
nnoremap <silent> <A-down> :call <SID>swap_down()<CR>

inoremap <A-up><esc> :call <SID>swap_up()<CR> i
inoremap <A-down><esc> :call <SID>swap_down()<CR>i


augroup toggleCocExtentions
  autocmd!
  autocmd BufEnter *.svelte call CocActionAsync('deactivateExtension',['coc-tabnine'])
  autocmd BufEnter *.tsx call CocActionAsync('deactivateExtension','coc-tabnine' )
  autocmd BufEnter *.jsx call CocActionAsync('deactivateExtension','coc-tabnine')
augroup END
