:- set_prolog_flag(double_quotes, chars).

lCP(Str,List):-                          %%Main function
    findall(Z,helper(Z, List),X),        %%Uses helper function to create a list of possible prefixes
    last(X,Longest),                     %%Takes the last prefix available
    toString(Str,Longest).               %%Uses toString to convert longest prefix(list of atoms) to a String

toString(Str,Longest):-                  %%Takes a list of atoms and converts it to a String
    atom_chars(Str,Longest).             %%   using inbuilt atom_chars function

helper(Z, List) :-                       %%Takes in a list of words and outputs a list of atoms
    maplist(prefix(Z),List).             %%inbuilt function prefix takes the prefix of each word and
                                         %%   maplist checks if prefix can be applied to each word in the list
