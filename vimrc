" =============================================================================
" NO COMPATIBILITY
" =============================================================================
set nocompatible

" =============================================================================
" LANGUAGE UI
" =============================================================================
language messages C
set langmenu=en_US.UTF-8

" =============================================================================
" VIM-PLUG
" =============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'easymotion/vim-easymotion'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kshenoy/vim-signature'
Plug 'yggdroot/indentline'
Plug 'airblade/vim-rooter'
Plug 'benmills/vimux'
Plug 'chaoren/vim-wordmotion'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'osyo-manga/vim-anzu'
Plug 'rhysd/committia.vim'
Plug 'rhysd/devdocs.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'chrisbra/NrrwRgn'
Plug 'dyng/ctrlsf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'alok/notational-fzf-vim'
Plug 'valloric/MatchTagAlways'
Plug 'dhruvasagar/vim-zoom'
Plug 'rbong/vim-flog'
Plug 'zplugin/zplugin-vim-syntax'
Plug 'vitalk/vim-simple-todo'
Plug 'arcticicestudio/nord-vim'
Plug 'drzel/vim-line-no-indicator'
Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'
Plug 'liuchengxu/vista.vim'
call plug#end()

" =============================================================================
" SET THE GUI COLOR SCHEME
" =============================================================================
set t_Co=256
if has("termguicolors")
  set termguicolors
  " set Vim-specific sequences for RGB colors
  if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif
color nord

" =============================================================================
" CHECK OS
" =============================================================================
if has('unix')
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    set guifont=FuraCode\ Nerd\ Font\ Mono\:h11
    set rtp+=/usr/local/opt/fzf
  else
    set guifont=FuraCode\ Nerd\ Font\ Mono\ 8
    set rtp+=~/.fzf
  endif
elseif has('win32') || has('win64')
  behave mswin
  set guifont=Hack\:9
  au GUIEnter * simalt ~n
endif

" =============================================================================
" SETTINGS
" =============================================================================
set fillchars+=vert:.                     " Change vertical split character
set guioptions=aAce                       " GUI options
set showtabline=2
set so=10                                 " Row after cursor
set fileformat=unix                       " set fileformat
set tabstop=2                             " N space for tab
set mouse=a                               " Mouse enabled
set colorcolumn=+1                        " Highlight column 81
set backupcopy=yes
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
set undolevels=1000 						          " n of changes that can be undone
set spelllang=it                          " set default spell to it
set softtabstop=2
set signcolumn=yes
set shortmess+=c
set noshowmode                            " Don't dispay mode in command line
set nonumber                              " Row number
set hidden                                " allow hidden buffer
set splitright                            " Open vertical splits to the right
set splitbelow                            " Open horizontal splits to the bottom
set wrapscan                              " Start search from the beginning
set nobackup                              " No backups
set nowritebackup                         " No backups
set noswapfile                            " No swap 
set noautowrite                           " no auto save on buffer switch
set noundofile                            " no undo files
set nofoldenable                          " Open all folds by default
set showcmd                               " Show command 
set showmatch                             " Show close bracket
set ignorecase                            " no case sensitive search patterns
set hlsearch                              " Highlight search results
set smartcase                             " Search with caps - override ignorecase
set esckeys                               " cursor keys in I mode
set noerrorbells                          " do not use errorbells
set nojoinspaces                          " two spaces after a period on join
set title                                 " show window title

" jump to the last known cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Set cursor position
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=NONE guibg=NONE
hi! StatusLineNC guifg=NONE guibg=NONE
" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=NONE guibg=NONE
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Make background color transparent for git changes
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE

" =============================================================================
" COMMENTED SETTINGS
" =============================================================================
" set textwidth=80 " use a different bground color after
" execute "set colorcolumn=" . join(range(81,335), ',') " Highlight from column 81
" set cursorcolumn " highlight the column the cursor is on
" set cursorline " highlight the line the cursor is on

" =============================================================================
" RANGER
" =============================================================================
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" =============================================================================
" FZF
" =============================================================================
" let g:fzf_commits_log_options = 'log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" =============================================================================
" VIM-STARTIFY
" =============================================================================
let g:startify_files_number = 8
" let g:startify_session_autoload = 1
let g:startify_padding_left = 3
let g:webdevicons_enable_startify = 1
let g:startify_session_delete_buffers = 1 " delete all buffers when loading or closing a session, ignore unsaved buffers
let g:startify_session_remove_lines = ['setlocal', 'winheight'] " lines matching any of the patterns in this list, will be removed from the session file
let g:startify_session_sort = 1 " sort sessions by alphabet or modification time
let g:startify_update_oldfiles = 1
let g:startify_change_to_dir = 1 " when opening a file or bookmark, change to its directory
let g:startify_fortune_use_unicode = 1 " beautiful symbols
" let g:startify_padding_left = 3 " the number of spaces used for left padding
let g:startify_session_sort = 1 " sort sessions by alphabet or modification time"
let g:startify_bookmarks = [
      \ {'d': '~/Dev'},
      \ {'w': '~/DevWeb'},
      \ {'c': '~/.vimrc'},
      \ {'z': '~/.zshrc'}
      \ ]
let g:startify_custom_header = [
      \'____      ____                              ',
      \'\   \    /   /       __   _______   _______ ',
      \' \   \  /   /       |  | |       \ |   ____|',
      \'  \   \/   / ______ |  | |  .--.  ||  |__   ',
      \'   \      / |______||  | |  |  |  ||   __|  ',
      \"    \\    \/          |  | |  '--'  ||  |____ ",
      \'     \__/           |__| |_______/ |_______|',
      \ ]
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ["  Sessions"]       },
      \ { 'type': 'bookmarks', 'header': ["  Bookmarks"]      },
      \ { 'type': 'files',     'header': ["  MRU Files"]            },
      \ { 'type': 'dir',       'header': ["  MRU Files in ". getcwd()] },
      \ { 'type': 'commands',  'header': ["  Commands"]       },
      \ ]

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
" =============================================================================
" CTRLSF
" =============================================================================
let g:ctrlsf_ackprg = 'rg'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_auto_focus = {
      \ "at": "start"
      \ }

" =============================================================================
" NOTATIONAL VIM
" =============================================================================
let g:nv_search_paths = ['~/Note', '~/ToDo']

" =============================================================================
" NETRW
" =============================================================================
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_preview = 1
" let g:netrw_alto = 0

" =============================================================================
" VIM-SIGNATURE
" =============================================================================
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

" =============================================================================
" COC
" =============================================================================
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = ['coc-solargraph', 'coc-highlight', 'coc-python', 'coc-yaml', 'coc-html', 'coc-css', 'coc-json', 'coc-snippets', 'coc-tsserver', 'coc-prettier', 'coc-flutter']
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

" =============================================================================
" LIGHTLINE AND LIGHTLINE-BUFFERLINE
" =============================================================================
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ],
      \             ['zoom'] ],
      \   'right':  [ ['linenoindicator'],
      \             [ 'rvm' ],
      \             [ 'fileformat' ],
      \             [ 'fileencoding' ],
      \             [ 'filetype' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'Lightlinegit',
      \   'zoom': 'Lightlinezoom',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'rvm': 'rvm#statusline',
      \   'filename': 'LightlineFilename',
      \   'readonly': 'LightLineReadonly',
      \   'currentfunction'  : 'CocCurrentFunction',
      \   'method'  : 'NearestMethodOrFunction',
      \   'mode'  : 'LightlineMode',
      \   'linenoindicator'  : 'LineNoIndicator',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'cocerror': 'LightLineCocError',
      \   'cocwarn': 'LightLineCocWarn',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'cocerror': 'error',
      \   'cocwarn' : 'warning',
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [['cocerror', 'cocwarn', 'currentfunction' ]]
      \ }
      \ }

function! LightlineMode()
  return &filetype ==# 'vista' ? 'VISTA' :
        \ &filetype ==# 'ctrlsf' ? 'CTRLSF' :
        \ &filetype ==# 'fugitive' ? 'FUGITIVE' :
        \ lightline#mode()
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFilename()
  let modified = &modified ? ' +' : ''
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:] . modified
  endif
  return expand('%') . modified
endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineCocError()
  let s:error_sign = get(g:, 'coc_status_error_sign')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let errmsgs = []
  if get(info, 'error', 0)
    call add(errmsgs, s:error_sign . info['error'])
  endif
  return trim(join(errmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

function! LightLineCocWarn() abort
  let s:warning_sign = get(g:, 'coc_status_warning_sign')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let warnmsgs = []
  if get(info, 'warning', 0)
    call add(warnmsgs, s:warning_sign . info['warning'])
  endif
  return trim(join(warnmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

function! Lightlinegit()
  let l:branch = fugitive#head()
  return l:branch ==# '' ? '' : ' ' . l:branch
endfunction

function! Lightlinezoom()
  return zoom#statusline()
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd User CocDiagnosticChange call lightline#update()
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" =============================================================================
" VIM-ZOOM
" =============================================================================
let g:zoom#statustext = ' ZOOM'

" =============================================================================
" VIM-HEXOKINASE
" =============================================================================
let g:Hexokinase_ftAutoload = ['*']
let g:Hexokinase_highlighters = ['sign_column']
" let g:Hexokinase_refreshEvents = ['BufWritePost']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba']

" =============================================================================
" FILETYPE
" =============================================================================
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufNewFile,BufRead /tmp/mutt-* set filetype=mail
autocmd BufNewFile,BufRead /*.rasi setf css
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile=1
" autocmd FileType ruby,eruby let g:rubycomplete_use_bundler=1
" autocmd BufRead,BufNewFile *.md setlocal spell

" =============================================================================
" FUNCTION
" =============================================================================
function RunWith (command)
  execute "w"
  execute "!clear;time " . a:command . " " . expand("%")
endfunction

" =============================================================================
" SUBTYPES
" =============================================================================
" Ruby
augroup ruby_subtypes
  autocmd!
  autocmd BufNewFile,BufRead *.pdf.erb let b:eruby_subtype='html'
  autocmd BufNewFile,BufRead *.pdf.erb set filetype=eruby
augroup END

" Jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" =============================================================================
" INDENTLINE
" =============================================================================
" let g:indentLine_setColors = 0
let g:indentLine_char = '|'
let g:indentLine_fileTypeExclude = [ 'startify' ]
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = '·'
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '·'

" =============================================================================
" VIM-RUBOCOP
" =============================================================================
let g:vimrubocop_keymap = 0
let g:vimrubocop_confi = '.rubocop.yml'

" =============================================================================
" VIM-ROOTER
" =============================================================================
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['.git', '.git/']

" =============================================================================
" DEVDOCS
" =============================================================================
let g:devdocs_filetype_map = {
      \   'ruby': 'rails',
      \   'javascript.js': 'jquery',
      \ }

" =============================================================================
" Vim-polyglot
" =============================================================================
let g:polyglot_disabled = []

" ============================================================================
" Vim-easymotion
" =============================================================================
let g:EasyMotion_smartcase = 1

" ============================================================================
" Vim-gutentags
" =============================================================================
set tags+=tags,.git/tags
let g:gutentags_enabled = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_resolve_symlinks = 1
let g:gutentags_ctags_tagfile = '.git/tags'
let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_extra_args = ['--fields=+l']
let g:gutentags_add_default_project_roots = 0

" ============================================================================
" Vista
" =============================================================================
let g:vista#renderer#enable_icon = 1
let g:vista#finders = ['fzf']
let g:vista_executive_for = {
  \ 'ruby': 'coc',
  \ }
let g:vista_fzf_preview = []

" =============================================================================
"<F1> open help
nnoremap <F2> :set invnumber<CR>
nnoremap <F3> :set number! relativenumber!<CR>
nmap <F4> :Goyo<CR>
nmap <F5> :set list! list?<CR>
nmap <silent> <F7> :Ranger<CR>
nmap <F8> :Vista<CR>
autocmd FileType ruby nmap <F10> :call RunWith("ruby")<cr>
autocmd FileType json nmap <F10> :%!python -m json.tool<cr>
nmap <Leader>bda :bd <C-a> <CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>nm :Dispatch npm start<CR>
nmap <Leader>nv :NV<CR>
nmap <Leader>p :FZF<CR>
nmap <Leader>r :Rg<CR>
nmap <Leader>l :Lines 
nmap <Leader>v :Vista finder<CR>
nmap <Leader>g :20G<CR> 
nmap <Leader>gg :GFiles?<CR> 
nmap <Leader>xx :VimuxPromptCommand<CR>
nmap <Leader>% :MtaJumpToOtherTag<CR>
nmap <silent> <Leader>sp :set spell!<CR>
nmap K <Plug>(devdocs-under-cursor)
map <Leader> <Plug>(easymotion-prefix)
nmap f <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(anzu-n-with-echo)
map  N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordExec
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <C-F>t :CtrlSFToggle<CR>
