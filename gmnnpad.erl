%put file name in the parentheses, cannot be capitalized (just for my own naming convention and troubleshooting since capitalization makes it think it is a variable)
-module(gmn).
% add all functions
-compile(export_all).


% Generate two random numbers
main() ->
Num1 = (random:uniform(100) + 1),
% checks the number given
io:format("~w~n", [Num1]),
Num2 = (random:uniform(100) + 1),
% checks the number given
io:format("~w~n", [Num2]),
getnumbers(Num1, Num2).

% Define a function to check the numbers
check(Num1, Num2, Number1, Number2) ->
    %checks to see if pass from get number to check works
    % io:format("check check "),
    % Check if inputs are valid
    case is_integer(Number1) and is_integer(Number2) of
        false ->
            io:format("please enter a valid whole number between 1 and 100~n");
            true ->
            % Compare the input numbers with the random numbers
            case {Number1, Number2} of
                {Num1, Num2} ->
                    io:format("You are correct!~n");
                {_, _} when Number1 > Num1 orelse Number2 > Num2 ->
                    case {Number1 > Num1, Number2 > Num2} of
                        {true, true} ->
                            io:format("both are high~n");
                        _ ->
                            io:format("one is more~n")
                    end;
		
                {_, _} when Number1 < Num1 orelse Number2 < Num2 ->
                    case {Number1 < Num1, Number2 < Num2} of
                       {true, true} ->
                            io:format("both are low~n");
                        _ ->
                            io:format("one is less~n")
                end    
            end
    end.
    
% Define a function to handle user input and call check()
getnumbers(Num1, Num2) ->
io:format("Enter two numbers by inputing the first number and pressing enter then the same for the second. "),
    % two different code tests, the first two were the ones originally suggested but give errors no matter input and second are undifined. The third works and was suggested on stackoverflow.
    % Number1 = list_to_integer(string:strip(io:get_line(""), both)),
    % Number2 = list_to_integer(string:strip(io:get_line(""), both)),
    % Number1 = list_to_integer(string(io:get_line(""))),
    % Number2 = list_to_integer(string(io:get_line(""))),
    {ok, [Number1]} = io:fread("input : ", "~d"),
    {ok, [Number2]} = io:fread("input : ", "~d"),
    %pass the given numbers and random numbers to the check function
    check(Num1, Num2, Number1, Number2).
 