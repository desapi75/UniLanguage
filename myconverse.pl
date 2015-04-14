%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% author: Salvatore DeSapio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run :-
	tty_clear,
	write('============================================='), nl,
	write('=             The-Magic-Conch               ='), nl,
	write('=        English to Shell Translater        ='), nl,
	write('============================================='), nl,
	converse.

converse :-
	nl, write('Hello, what would you like me to do?'), nl,
	read(Sentence), 
	parse_sentence(Sentence).

parse_sentence([quit]) :- !.
parse_sentence(Sentence) :-
	s(Fact, Sentence, []), !,
	respond_to_sentence(Fact).
	
parse_sentence(_) :-
	write('Please rephrase that.'), nl,
	converse.
respond_to_sentence(Command) :-
	call(Command),
	write('I just ran the command, '), write(Command), nl, !.
