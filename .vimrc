" ======= 通用设置 ======= "
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
color molokai 
set number
set ruler
set background=dark
set foldmethod=indent

" 自动切换语法高亮
function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction
nmap <silent> ;s :call ToggleSyntax()<CR>

" ===== 引号 && 括号自动匹配 ===== "
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4
set nocompatible
inoremap jk <ESC>
" ===== nerdtree 设定 ===== "
nnoremap <F2> :exe 'NERDTreeToggle'<CR>
let g:NERDTreeWinSize = 20
autocmd VimEnter * NERDTree | wincmd p
"terminate when there is only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ===== taglist 设定 ===== "
nnoremap <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" ===== yankering 设定 ===== "
let g:yankring_history_dir = '~/.vim/bundle/yankring'

" ===== latex-box 设定 ====="
let g:LatexBox_output_type = "pdf"
let g:LatexBox_viewer = "open"
