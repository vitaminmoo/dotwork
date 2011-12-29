runtime vimrc_example.vim

" pathogen
call pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

syntax on
set confirm
set notitle

set nobackup

set nowrap
set shiftwidth=4
set tabstop=4
set shiftround
set expandtab
set autoindent

set formatoptions-=t
set textwidth=0

filetype on
autocmd FileType c,cpp,slang set cindent
autocmd FileType c set formatoptions+=ro
autocmd FileType perl set smartindent
autocmd FileType css set smartindent
autocmd FileType html set formatoptions+=tl
autocmd FileType make set noexpandtab shiftwidth=8

set matchpairs+=<:>

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

set backspace=eol,start,indent

inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>

set fdm=indent
"colorscheme rdark

" match these
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
"
vnoremap ( s()<Esc>P
vnoremap [ s[]<Esc>P
vnoremap { s{}<Esc>P

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc == "" |
                \		setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
endif


function! CleverTabNext()
    if pumvisible()
        return "\<C-N>"
    endif
    if col('.') == 1
        return "\<Tab>"
    elseif getline('.') =~ '^$'
        return "\<Tab>"
    elseif strpart( getline('.'), col('.') - 2, 1) =~ '^\s*$'
        return "\<Tab>"
    elseif exists('&omnifunc') && &omnifunc != ''
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction

function! CleverTabPrev()
    if pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfunction

inoremap <Tab> <C-R>=CleverTabNext()<CR>
inoremap <S-Tab> <C-R>=CleverTabPrev()<CR>

noremap <silent> <F11> :cal VimCommanderToggle()<CR>

