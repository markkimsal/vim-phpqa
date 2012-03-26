" phpcodesniffer.vim -- Revisar los estándares de programación con
" PhpCodeSniffer 
" @Author:      Eduardo Magrané , basado en phpchecksyntax de Thomas Link (samul@web.de)
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     31-Oct-2009.
" @Last Change: .
" @Revision:    0.2.21
" @todo Aceptar parámetro de standard que se desea
if exists("g:php_check_codesniffer")
	finish
endif

let g:php_check_codesniffer = 1

if !exists("g:phpqa_codesniffer_cmd")
	let g:phpqa_codesniffer_cmd='phpcs --standard=Cake --report=emacs'
endif

if !exists("g:phpqa_messdetector_cmd")
	let g:phpqa_messdetector_cmd='phpmd'
endif

function! phpqa:RunCommands() 
	if &filetype == 'php'
		let retval=phpqa#PhpLint()
		if 0 == retval
			call phpqa#PhpCodeSniffer()
		endif
	endif	
endf

"autocmd BufWritePost *.php call PhpCodeSniffer()
autocmd BufWritePost *.php call phpqa:RunCommands()
