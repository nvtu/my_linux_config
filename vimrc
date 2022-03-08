" -----------------------------------------------------------------------------
" Plugins: {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'preservim/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'philrunninger/nerdtree-visual-selection'
Plugin 'scrooloose/syntastic'
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'rakr/vim-one'
Plugin 'ycm-core/YouCompleteMe'


" My plugins
Bundle 'ajh17/spacegray.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-surround'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'hdima/python-syntax'
Bundle 'tpope/vim-repeat'
Bundle 'embear/vim-localvimrc'
Bundle 'leafgarland/typescript-vim'
" Bundle 'valloric/youcompleteme'
" Bundle 'scrooloose/nerdtree'


call vundle#end()
filetype plugin indent on
" }}}

" Plugin settings: {{{

" netrw
" Hide .swp, .pyc, ENV/, .git/, *.map
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,ENV,.git/,.*\.map'
" Override netrw settings to show line numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" YouCompleteMe
let mapleader=","
let g:ycm_autoclose_preview_window_after_completion = 1		 " Auto close preview tab
let g:ycm_goto_buffer_command = 'vertical-split'						" Goto definition in new split
nnoremap <leader>jd :YcmCompleter GoTo<CR>
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_collect_identifiers_from_tags_files = 1					 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1											 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1									" Completion for programming language's keyword
let g:ycm_complete_in_comments = 1													" Completion in comments
let g:ycm_complete_in_strings = 1													 " Completion in string
"
" indentLine
let g:indentLine_color_term = 237
let g:indentLine_char = '┆'

"jellybeans
"set background=dark
"color jellybeans	" set background=dark for other machine, but use jellybeans in my computer
" }}}
"spacegray
"""" CONFIGURE FOR ONEHALF THEME
syntax on
set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
"let g:spacegray_underline_search = 1
"let g:spacegray_use_italics = 1
"let g:spacegray_low_contrast = 1


" vim-localvimrc
"let g:localvimrc_whitelist='/Users/trungnt/Code/'

" -----------------------------------------------------------------------------
" Stuffs that should be set by default: {{{
syntax on
set softtabstop=4
set expandtab
set tabstop=4
set shiftwidth=4
map <F2> :retab <CR> :wq! <CR>
set nocompatible	" use new features whenever they are available
set bs=2					" backspace should work as we expect
set autoindent
set history=50		" remember last 50 commands
set ruler				  " show cursor position in bottom line
set nu						" show line number
set hlsearch			" highlight search result
" y and d put stuff into system clipboard (so that other apps can see it)
set clipboard=unnamedplus
"set mouse=a			 " enable mouse. At least this should work for iTerm
set textwidth=0
" Open new split to right / bottom
set splitbelow
set splitright
" Automatically update changed files (but need to focus on the file)
set autoread
set foldmethod=indent
set foldlevel=20
set number relativenumber
" }}}

" Misc {{{
set autoread			" auto re-read changes outside vim
set autowrite		 " auto save before make/execute
set pastetoggle=<F10>
set showcmd
set timeout			 " adjust timeout for mapped commands
set timeoutlen=1200


" vim scripts
function! VIMSET()
	set nowrap
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
endfunction

" Makefile
function! MAKEFILESET()
	set nowrap
	" in a Makefile we need to use <Tab> to actually produce tabs
	set noexpandtab
	set softtabstop=8
	iunmap <Tab>
endfunction

" Hack to make bg black with jellybeans
hi Normal ctermbg=none
hi LineNr ctermbg=none
hi NonText ctermbg=none

" Compile C++
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR> 

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif     

" Shortcut to open NerdTree
noremap <C-f> :NERDTreeFind<CR>
noremap <Leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>

map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
" map <C-n> :tabnew<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\\.swo$', '\\.swp$', '\\.git']
let NERDTreeChDirMode=0
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"" Setup for Syntastic
"set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint']

