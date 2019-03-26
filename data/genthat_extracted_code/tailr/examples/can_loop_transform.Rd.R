library(tailr)


### Name: can_loop_transform_
### Title: Tests if a function, provided by its name, can be transformed.
### Aliases: can_loop_transform_ can_loop_transform

### ** Examples

factorial <- function(n)
    if (n <= 1) 1 else n * factorial(n - 1)
factorial_acc <- function(n, acc = 1)
    if (n <= 1) acc else factorial_acc(n - 1, n * acc)

can_loop_transform(factorial) # FALSE -- and prints a warning
can_loop_transform(factorial_acc) # TRUE

can_loop_transform_(rlang::quo(factorial)) # FALSE -- and prints a warning
can_loop_transform_(rlang::quo(factorial_acc)) # TRUE



