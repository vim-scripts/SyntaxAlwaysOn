" File: SyntaxAlwaysOn.vim
" Version: 0.1
" Author: Hong Xu(xuphys AT gmail DOT com)
" Last Change: 3 May 2010
" Description: this plugin aims to fix the vim's "syntax off" bug -- sometimes
" vim makes syntax off unexpectedly. 
" License: You can redistribute this plugin and / or modify it under the terms 
"          of the GNU General Public License as published by the Free Software 
"          Foundation; either version 2, or any later version. 

if v:version < 700
    finish
endif

" check whether this script is already loaded
if exists("g:loaded_SyntaxAlwaysOn")
    finish
endif
let g:loaded_SyntaxAlwaysOn = 1

if !has("autocmd")
    echo "Your vim don't have autocmd feather added. This plugin won't work."
    finish
endif

let s:saved_cpo = &cpo
set cpo&vim

" varibles
let g:SyntaxAlwaysOn_version = 1 "version 

if !exists("g:TurnOnSyntaxAlwaysOn")
    let g:TurnOnSyntaxAlwaysOn=1
endif


"to fix the vim buffer syntax off bug
function s:FTurnOnSyntaxAlwaysOn()
    let g:TurnOnSyntaxAlwaysOn = 1
    if has("autocmd")  
        autocmd BufDelete * syntax on
        autocmd BufEnter * syntax on
    endif
endfunction

if(g:TurnOnSyntaxAlwaysOn != 0)
    call s:FTurnOnSyntaxAlwaysOn()
endif


command TurnOnSyntaxAlwaysOn call s:FTurnOnSyntaxAlwaysOn()

let &cpo = s:saved_cpo
