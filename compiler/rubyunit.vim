" Vim compiler file
" Language:		Test::Unit - Ruby Unit Testing Framework
" Maintainer:		Doug Kearns <dougkearns@gmail.com>
" URL:			https://github.com/vim-ruby/vim-ruby
" Release Coordinator:	Doug Kearns <dougkearns@gmail.com>

if exists("current_compiler")
  finish
endif
let current_compiler = "rubyunit"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=testrb\ -I\ test:lib
CompilerSet errorformat=
    \%E%f:%l:\ syntax\ error\\,\ %m,
    \%W%f:%l:\ warning:\ %m,
    \%-C%\tfrom\ %f:%l:in\ %.%#,
    \%-Z%\tfrom\ %f:%l,
    \%-Z%p^,
    \%E\ %\\+%\\d%\\+)\ Failure:,
    \%E\ %\\+%\\d%\\+)\ Error:,
    \%C\ %\\+[%f:%l:%.%#,
    \%-C\ %\\+%.%#,
    \%C%m,
    \%Z\ %#,
    \%E%f:%l:%m,
    \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
