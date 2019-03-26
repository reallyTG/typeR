library(functools)


### Name: Andify
### Title: Predicate function operator that creates new predicate functions
###   linked by the && operator.
### Aliases: Andify

### ** Examples

# Examples
is_numeric <- is.numeric
is_even <- function(x) x %% 2 == 0
greater_than_10 <- function(x) x > 10
less_than_100 <- function(x) x < 100
even_number_between_10_and_100 <-
Andify(is_numeric, is_even, greater_than_10, less_than_100)
even_number_between_10_and_100(8) # FALSE
even_number_between_10_and_100(9) # FALSE
even_number_between_10_and_100(10) # FALSE
even_number_between_10_and_100(11) # FALSE
even_number_between_10_and_100(12) # TRUE
even_number_between_10_and_100(49) # FALSE
even_number_between_10_and_100(50) # TRUE
even_number_between_10_and_100(100) # FALSE
even_number_between_10_and_100(101) # FALSE
even_number_between_10_and_100(102) # FALSE



