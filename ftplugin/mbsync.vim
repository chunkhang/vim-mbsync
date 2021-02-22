if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1
let b:undo_ftplugin = "setl com<"

setlocal commentstring=#\ %s

if !has('unix')
  finish
endif

if !has('gui_running')
  command! -buffer -nargs=1 Sman
        \ silent exe '!' . 'LESS= MANPAGER="less --pattern=''\b' . <q-args> . '\b'' --hilite-search --squeeze-blank-lines" man ' . 'mbsync' |
        \ redraw!
elseif has('terminal')
  command! -buffer -nargs=1 Sman
        \ silent exe 'term ' . 'env LESS= MANPAGER="less --pattern=''\\b' . <q-args> . '\\b'' --hilite-search --squeeze-blank-lines" man ' . 'mbsync'
else
  finish
endif
setlocal iskeyword+=-
setlocal keywordprg=:Sman
let b:undo_ftplugin .= "iskeyword< keywordprg<"
