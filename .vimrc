let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
if has("cscope")
        if filereadable("./cscope.out")
	       	cscope add  ./cscope.out
		set tags=./tags;
		set autochdir
	else
	       	cscope add  $dir/cscope.out
		set tags=$dir/tags;
		set autochdir
	endif
endif
"map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!gcc -Wall -g % -o %<"
  exec "! ./%<"
endfunc
nmap <C-m>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-m>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-m>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-m>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"map <C-L> <C-x><C-o>
""""""""""""""""""""""""""""""
   " netrw setting
""""""""""""""""""""""""""""""
   let g:netrw_winsize = 30
   nmap  fe :Sexplore!  
 """"""""""""""""""""""""""""""
 " BufExplorer
 """"""""""""""""""""""""""""""
   let g:bufExplorerDefaultHelp=0       " Do not show default help.
   let g:bufExplorerShowRelativePath=1  " Show relative paths.
   let g:bufExplorerSplitRight=0        " Split left.
   let g:bufExplorerSplitVertical=1     " Split vertically.
   let g:bufExplorerSplitVertSize = 30  " Split width
   let g:bufExplorerUseCurrentWindow=1  " Open in new window.
 """"""""""""""""""""""""""""""
   "tab window command 
 """"""""""""""""""""""""""""""
nmap <C-n> :tabn<CR> 
nmap <C-p> :tabp<CR> 
nmap <C-c> :tabc<CR> 
nmap <C-o> :tabo<CR> 
nmap <C-i> :tabnew ~/source<CR> 
""""""""""""""""""""""""""""""
   " winManager setting
""""""""""""""""""""""""""""""
   let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
   let g:winManagerWidth = 30
   let g:defaultExplorer = 0
   nmap  wm :WMToggle<cr> 
"map <c-k> :FirstExplorerWindow<cr>
"map <c-l> :BottomExplorerWindow<cr>
map <c-l> <c-w><c-l>
map <c-h> <c-w><c-h>
map <c-j> <c-w><c-j>
map <c-k> <c-w><c-k>
map <wm> :WMToggle<cr>
"nmap <F8> :wa:TlistUpdate
":FirstExplorerWindowb
:set backspace=indent,eol,start
let counter = 0
"inoremap <expr> <C-L> ListItem() 
"inoremap <expr> <C-R> ListReset()
inoremap <expr> <C-l> InsertSh()
inoremap <expr> <C-r> InsertInc()
"inoremap <c-o> <c-[>o
func ListItem()
    	 let g:counter += 1
   	 return g:counter . '. '
endfunc

func ListReset()
 	 let g:counter = 0
	 return ''
endfunc

func InsertSh()
   	 return '#!/bin/sh' 
endfunc

func InsertInc()
   	 return '#include<'
endfunc

