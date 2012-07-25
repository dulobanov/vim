" ---------------------------------------------------------------
"			Terminal preerences
" ---------------------------------------------------------------
colorscheme denlv                     "цветовая схема для терминала
set background=dark                     "фон терминала - темный





" ---------------------------------------------------------------
"			Turn on modules
" ---------------------------------------------------------------
:helptags $HOME/.vim/doc/



" ---------------------------------------------------------------
"			Preerences
" ---------------------------------------------------------------
set directory=$HOME/.vim/tmp//		" сохрнять ременные файлы в этой директории
set nobackup                            "не создавать файлы с резервной копией (filename.txt~)"
set ttyfast                             "коннект с терминалом быстрый
set splitbelow                          "новое окно появляется снизу
set stal=2                              "постоянно выводим строку с табами
set tpm=100                             "максимальное количество открытых табов
set list                                "Отображаем табуляции и конечные пробелы...
set listchars=tab:→→,trail:⋅		" --
set nocompatible			"отключаем совместимость с vi
set foldmethod=indent			"сворачивание на основании отступов в начале строк
set ruler				"постоянно показывать позицию курсора
set showcmd showmode			"показывать незавершенные команды и текущий режим
set incsearch				"показывать первое совпадение при наборе шаблона
set number				"показывать номер строк
set wrap				"не разрывать строку при подходе к краю экрана
set ai					"при начале новой строки, отступ копируется из предыдущей
set cin					"формат отступов c++
set showmatch				"показываем открывающие и закрывающие скобки
" 			search
set hlsearch				"подсветка найденного
set incsearch				"показывать первое совпадение при наборе шаблона
set ignorecase				"игнорируем регистр символов при поиске
set lz			" I don't know
set scrolljump=7			" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolloff=7				" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set guioptions-=T			" Скрыть панель в gui версии ибо она не нужна
set ch=1				" Сделать строку команд высотой в одну строку
set mousehide				" Скрывать указатель мыши, когда печатаем
set autoindent				" Включить автоотступы
syntax on				" Влючить подстветку синтаксиса
set smartindent				" Включаем "умные" отспупы ( например, автоотступ после {)

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb=   

" Поддержка мыши
set mouse=a
set mousemodel=popup

" Кодировка текста по умолчанию
set termencoding=utf-8

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Размер табулации по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2

" Fix <Enter> for comment
set fo+=cr

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages





"-------------------------
" Горячие клавишы
"-------------------------

" Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" C-y - удаление текущей строки
nmap <C-y> dd
imap <C-y> <esc>ddi

" C-d - дублирование текущей строки
imap <C-d> <esc>yypi

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - просмотр ошибок
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" F4 - покзать регистры
map <F4> :reg<cr>

" F7 - инвертировть подсветку поиска
nmap <F7> :set hlsearch!<CR>

" F8 - удаление конечных пробелов
map <F8> :%s/\s\+$//<cr>

" F10 - переключаемся между соответствующими *.c и *.h файлами
" в текущем каталоге (used a.vim)
imap <F10> <Esc>:AT<CR>
nmap <F10> :AT<CR>

" F11 - открыть пустую вкладку
nmap <F11> :tabnew<cr>
imap <F11> <esc>:tabnew<cr>

" F12 - обозреватель файлов
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv


" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

" Редко когда надо [ без пары =)
imap [ []<LEFT>
" Аналогично и для {
imap {<CR> {<CR>}<Esc>O

" С-q - выход из Vim 
map <C-Q> <Esc>:qa<cr>


" Автозавершение слов по tab =)
function InsertTabWrapper()
     let col = col('.') - 1
     if !col || getline('.')[col - 1] !~ '\k'
         return "\<tab>"
     else
         return "\<c-p>"
     endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов 
set complete+=t

" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on
au BufRead,BufNewFile *.phps    set filetype=php
au BufRead,BufNewFile *.thtml    set filetype=php


set completeopt-=preview
set completeopt+=longest
set mps-=[:]

"-------------------------
" PHP настройки
"-------------------------

" Используем словарь PHP для автодополнения,
" который можно скачать отсюда http://lerdorf.com/funclist.txt
" set dictionary=~/.vim/dic/php

" Сделаем удобную навигацию по мануалу PHP
" set keywordprg=~/.vim/bin/php_doc 

" Проверка синтаксиса PHP
" set makeprg=php\ -l\ %

" Формат вывода ошибок PHP
" set errorformat=%m\ in\ %f\ on\ line\ %l

" Полезные "быстрые шаблоны"
" Вывод отладочной информации
" iabbrev dbg echo '<pre>';var_dump( );echo '</pre>';
" iabbrev tm echo 'Test message in file: '.__FILE__.', on line: '.__LINE__;

" let g:pdv_cfg_Uses = 1

" Vim постовляется с достаточно мощным плугином подстветки синтаксиса PHP.
" Помимо прочего он умеет:

" Включаем фолдинг для блоков классов/функций
" let php_folding = 1

" Не использовать короткие теги PHP для поиска PHP блоков
" let php_noShortTags = 1

" Подстветка SQL внутри PHP строк
" let php_sql_query=1

" Подстветка HTML внутри PHP строк
" let php_htmlInStrings=1 

" Подстветка базовых функций PHP
" let php_baselib = 1














