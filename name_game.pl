:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    action(Choice).

action(1) :- !,
    show_letters,
    menu.

action(2) :- !,
    write('Enter the letter to add:'), nl,
    read(L),
    assert(letter(L)),
    menu.

action(3) :- !,
    write('Enter the letter to add at the top:'), nl,
    read(L),
    asserta(letter(L)),
    menu.

action(4) :- !,
    write('Enter the letter to add at the bottom:'), nl,
    read(L),
    assertz(letter(L)),
    menu.

action(5) :- !,
    write('Enter the letter to delete:'), nl,
    read(L),
    (   retract(letter(L))
    ->  write('Deleted.'), nl
    ;   write('That letter is not in the set.'), nl
    ),
    menu.

action(6) :- !,
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

action(7) :- !,
    write('Goodbye!'), nl,
    halt.

action(_) :-
    write('Invalid choice, please enter a number from 1 to 7.'), nl,
    menu.

show_letters :-
    findall(L, letter(L), Letters),
    (   Letters == []
    ->  write('The set is empty.'), nl
    ;   write('Current letters: '), write(Letters), nl
    ).
