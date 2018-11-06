set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'itchyny/lightline.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'reisub0/hot-reload.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mxw/vim-jsx'
Plugin 'morhetz/gruvbox'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"General
"++++++++++++++++++
set number " it shows line number
set cursorline " Highlighting that moves
set softtabstop=2	" Number of spaces per Tab
set tabstop=2	" Number of spaces per Tab
set autoindent	" Auto-indent new lines
set smartindent
set wrap
set shiftwidth=2	" Number of auto-indent spaces
set noexpandtab " Use tabs, not spaces
set noswapfile " Disable temporary files
set showmatch	" show match braces
"+++++++++++++NERDTree+++++++++++++++
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"++++++++++++++LightLine++++++++++++
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }
"++++++++Color Schemes++++++++++++
syntax on
colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast='hard'
let g:gruvbox_hls_cursor='orange'
let g:gruvbox_termcolors=256
let g:gruvbox_italicize_comments=1
"+++++++++Dart++++++++++++++++++
let dart_html_in_string=v:true
let dart_style_guide=2
let dart_format_on_save=1
"+++++++++JSx+++++++++++++++++++
let g:jsx_ext_required=1
let g:jsx_pragma_required =1
"+++++++++CTRLp++++++++++++++++
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"+++++++++++GitGutter++++++++++++
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_highlight_lines = 1

" :Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
