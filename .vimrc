" *******TIPS**********
" :%s/foo/bar/g "search and replace 'foo' with 'bar' in all instances in all lines
" :s/foo/bar/g  "search and replace all instances in current line
" :%s/foo/bar/gc "ask for confirmation
" :%s/foo/bar/gci "case insensitive
" :%s/foo/bar/gcI "case sensitive

" Ctrl-O to jump to previous location
" Ctrl-I to jump to next location
" :jumps to see jump list
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/badwolf'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
"Plugin 'ervandew/supertab'
Plugin 'tomasr/molokai'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'sheerun/vim-polyglot'
"Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'marijnh/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Colorschemtube.com/e config"
syntax enable
"set background=dark
colorscheme molokai

" Indent Guides config
"autocmd VimEnter * IndentGuidesEnable
nnoremap <leader>ig :IndentGuidesToggle<CR>
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"Syntastic config"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall"
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_auto_loc_list = 0

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" YouCompleteMe settings
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'
nnoremap <F5> :YcmForceCompileAndDiagnostics <CR>
nnoremap <C-g> :YcmCompleter GoTo<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set autoindent

set number "set line numbers by default"
set showcmd         " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" ag.vim shortcut
nnoremap <leader>a :Ag

" tab configs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" split window shortcuts
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>
nnoremap <C-n> <C-w><C-w>

set splitbelow
set splitright
set autoindent

" cut/copy/paste shortcuts
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" NERDTree shortcut
map <leader>t :NERDTreeToggle<CR>

" map PyClewn shortcuts
nnoremap <F11> :Pyclewn<CR>
nnoremap <C-F11> :Pyclewn pdb %:p<CR>
nnoremap <F12> :Cexitclewn<CR>
nnoremap ,n :Cnext<CR>
nnoremap ,s :Cstep<CR>
nnoremap ,c :Ccontinue<CR>
nnoremap ,r :Crun<CR>
nnoremap ,f :Cfile
nnoremap ,p :Cprint
nnoremap ,b :Cbreak
nnoremap ,v :Cdbgvar
nnoremap ,dv :Cdelvar

" highlight characters over 80 limit in red
" set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
