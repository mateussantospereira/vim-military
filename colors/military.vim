" Modifier: Mateus dos Santos Pereira
" Source repository: https://github.com/mateussantospereira/vim-military

" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-distinguished

" Initialization {{{
	set background=dark

	hi clear
	if exists('syntax_on')
		syntax reset
	endif

	let g:colors_name = 'military'

	if ! has('gui_running')
		if &t_Co != 256
			echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'

			finish
		endif
	endif
" }}}
" Color dictionary parser {{{
	function! s:ColorDictParser(color_dict)
		for [group, group_colors] in items(a:color_dict)
			exec 'hi ' . group
				\ . ' ctermfg=' . (group_colors[0] == '' ? 'NONE' :       group_colors[0])
				\ . ' ctermbg=' . (group_colors[1] == '' ? 'NONE' :       group_colors[1])
				\ . '   cterm=' . (group_colors[2] == '' ? 'NONE' :       group_colors[2])
		endfor
	endfunction
" }}}

"	   | Highlight group                |  CTFG |  CTBG |    CTAttributes |
"	   |--------------------------------|-------|-------|-----------------|
call s:ColorDictParser({
	\   'Normal'                      : [    231,     '',               '']
	\ , 'Visual'                      : [    240,    253,               '']
	\
	\ , 'Cursor'                      : [     '',     '',               '']
	\ , 'lCursor'                     : [     '',     '',               '']
	\
	\ , 'CursorLine'                  : [     '',    236,               '']
	\ , 'CursorLineNr'                : [    231,    240,               '']
	\ , 'CursorColumn'                : [    231,    237,               '']
	\
	\ , 'Folded'                      : [    249,    234,               '']
	\ , 'FoldColumn'                  : [    243,    234,               '']
	\ , 'SignColumn'                  : [    231,    233,           'bold']
	\ , 'ColorColumn'                 : [      '',   233,               '']
	\
	\ , 'StatusLine'                  : [    231,    236,           'bold']
	\ , 'StatusLineNC'                : [    244,    232,               '']
	\ , 'StatusLineTerm'              : [    232,    248,           'bold']
	\ , 'StatusLineTermNC'            : [    244,    232,               '']
	\
	\ , 'LineNr'                      : [    248,    235,               '']
	\ , 'VertSplit'                   : [    240,     '',               '']
	\
	\ , 'WildMenu'                    : [    234,    231,               '']
	\ , 'Directory'                   : [    154,     '',               '']
	\ , 'Underlined'                  : [    130,     '',               '']
	\
	\ , 'netrwClassify'               : [    142,     '',           'bold']
	\
	\ , 'Question'                    : [     74,     '',           'bold']
	\ , 'MoreMsg'                     : [    214,     '',           'bold']
	\ , 'WarningMsg'                  : [    202,     '',           'bold']
	\ , 'ErrorMsg'                    : [    196,     '',           'bold']
	\
	\ , 'Comment'                     : [    243,     '',               '']
	\ , 'vimCommentTitleLeader'       : [    250,     '',               '']
	\ , 'vimCommentTitle'             : [    250,     '',               '']
	\ , 'vimCommentString'            : [    245,     '',               '']
	\
	\ , 'TabLine'                     : [    231,    238,               '']
	\ , 'TabLineSel'                  : [    255,     '',           'bold']
	\ , 'TabLineFill'                 : [    240,    238,               '']
	\ , 'TabLineNumber'               : [    160,    238,           'bold']
	\ , 'TabLineClose'                : [    245,    238,           'bold']
	\
	\ , 'SpellCap'                    : [    231,     31,           'bold']
	\
	\ , 'SpecialKey'                  : [    239,     '',               '']
	\ , 'NonText'                     : [     88,     '',               '']
	\ , 'MatchParen'                  : [    231,    142,           'bold']
	\
	\ , 'Constant'                    : [    137,     '',           'bold']
	\ , 'Special'                     : [    150,     '',               '']
	\ , 'Identifier'                  : [    173,     '',           'bold']
	\ , 'Statement'                   : [    190,     '',           'bold']
	\ , 'PreProc'                     : [    247,     '',               '']
	\ , 'Type'                        : [    111,     '',           'bold']
	\ , 'String'                      : [    155,     '',               '']
	\ , 'Number'                      : [    221,     '',               '']
	\ , 'Define'                      : [    173,     '',               '']
	\ , 'Error'                       : [    208,    124,               '']
	\ , 'Function'                    : [    179,     '',               '']
	\ , 'Conditional'                 : [    190,     '',           'bold']
	\ , 'Include'                     : [    173,     '',               '']
	\ , 'PreCondit'                   : [    173,     '',               '']
	\ , 'Keyword'                     : [    173,     '',               '']
	\ , 'Search'                      : [    231,    131,               '']
	\ , 'Title'                       : [    231,     '',               '']
	\ , 'Delimiter'                   : [    246,     '',               '']
	\ , 'StorageClass'                : [    187,     '',               '']
	\ , 'Operator'                    : [    180,     '',               '']
	\
	\ , 'TODO'                        : [    228,     94,           'bold']
	\
	\ , 'SyntasticWarning'            : [    220,     94,               '']
	\ , 'SyntasticError'              : [    202,     52,               '']
	\
	\ , 'Pmenu'                       : [    249,    238,               '']
	\ , 'PmenuSel'                    : [    255,    245,               '']
	\ , 'PmenuSbar'                   : [    253,    248,               '']
	\
	\ , 'CocSearch'                   : [    148,     '',               '']
	\ , 'CocMenuSel'                  : [     '',    237,               '']
	\ , 'CocFloating'                 : [     '',    234,               '']
	\
	\ , 'phpEOL'                      : [    245,     '',               '']
	\ , 'phpStringDelim'              : [     94,     '',               '']
	\ , 'phpDelimiter'                : [    160,     '',               '']
	\ , 'phpFunctions'                : [    221,     '',           'bold']
	\ , 'phpBoolean'                  : [    172,     '',           'bold']
	\ , 'phpOperator'                 : [    215,     '',               '']
	\ , 'phpMemberSelector'           : [    138,     '',           'bold']
	\ , 'phpParent'                   : [    227,     '',               '']
	\
	\ , 'PHPClassTag'                 : [    253,     '',               '']
	\ , 'PHPInterfaceTag'             : [    253,     '',               '']
	\ , 'PHPFunctionTag'              : [    222,     '',           'bold']
	\
	\ , 'pythonDocString'             : [    240,    233,               '']
	\ , 'pythonDocStringTitle'        : [    245,    233,               '']
	\ , 'pythonRun'                   : [     65,     '',               '']
	\ , 'pythonBuiltinObj'            : [     67,     '',           'bold']
	\ , 'pythonSelf'                  : [    250,     '',           'bold']
	\ , 'pythonFunction'              : [    179,     '',           'bold']
	\ , 'pythonClass'                 : [    221,     '',           'bold']
	\ , 'pythonExClass'               : [    130,     '',               '']
	\ , 'pythonException'             : [    130,     '',           'bold']
	\ , 'pythonOperator'              : [    190,     '',               '']
	\ , 'pythonPreCondit'             : [    152,     '',           'bold']
	\ , 'pythonDottedName'            : [    166,     '',               '']
	\ , 'pythonDecorator'             : [    124,     '',           'bold']
    \
    \ , 'javaScriptComment'           : [    240,    233,               '']
    \ , 'javaScriptFunction'          : [    179,     '',           'bold']
    \ , 'javaScriptKeyword'           : [    130,     '',           'bold']
    \ , 'javaScriptOperator'          : [    190,     '',               '']
    \ , 'javaScriptString'            : [    240,    233,               '']
    \ , 'javaScriptNumber'            : [    221,     '',               '']
    \ , 'javaScriptClass'             : [    221,     '',           'bold']
    \ , 'javaScriptBuiltin'           : [    67,      '',           'bold']
    \ , 'javaScriptException'         : [    130,     '',           'bold']
    \ , 'javaScriptIdentifier'        : [    172,     '',           'bold']
    \ , 'javaScriptDecorator'         : [    124,     '',           'bold']
    \ , 'javaScriptReserved'          : [    208,     '',           'bold']
    \ , 'javaScriptNull'              : [    130,     '',               '']
    \ , 'javaScriptBoolean'           : [    124,     '',           'bold']
	\
	\ , 'PythonInterfaceTag'          : [    109,     '',               '']
	\ , 'PythonClassTag'              : [    221,     '',               '']
	\ , 'PythonFunctionTag'           : [    109,     '',               '']
	\ , 'PythonVariableTag'           : [    253,     '',               '']
	\ , 'PythonMemberTag'             : [    145,     '',               '']
	\
	\ , 'CTagsImport'                 : [    109,     '',               '']
	\ , 'CTagsClass'                  : [    221,     '',               '']
	\ , 'CTagsFunction'               : [    109,     '',               '']
	\ , 'CTagsGlobalVariable'         : [    253,     '',               '']
	\ , 'CTagsMember'                 : [    145,     '',               '']
	\
	\ , 'xmlTag'                      : [    252,     '',               '']
	\ , 'xmlTagName'                  : [    119,     '',               '']
	\ , 'xmlEndTag'                   : [    252,     '',               '']
	\
	\ , 'htmlLink'                    : [    231,     '',      'underline']
	\
	\ , 'cssImportant'                : [    166,     '',           'bold']
	\
	\ , 'DiffAdd'                     : [    112,     22,               '']
	\ , 'DiffChange'                  : [    220,     94,               '']
	\ , 'DiffDelete'                  : [    160,     '',               '']
	\ , 'DiffText'                    : [    220,     94,   'reverse,bold']
	\
	\ , 'diffLine'                    : [     68,     '',           'bold']
	\ , 'diffFile'                    : [    242,     '',               '']
	\ , 'diffNewFile'                 : [    242,     '',               '']
\ })

hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete
