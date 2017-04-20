set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'rust-lang/rust.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set statusline+=[%n]\ %t
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint', 'tern_lint']
let g:syntastic_typescript_checkers = ['tslint'] 
let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

" Javascript stuff
let g:javascript_plugin_jsdoc = 1

" Rust stuff
let g:syntastic_rust_checkers = []
let g:rustfmt_autosave = 1
let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

syntax on

set backspace=indent,eol,start
set number
set expandtab
set shiftwidth=2
set softtabstop=2
" set hidden
set list
set listchars=nbsp:…,tab:▸\ ,trail:·

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
