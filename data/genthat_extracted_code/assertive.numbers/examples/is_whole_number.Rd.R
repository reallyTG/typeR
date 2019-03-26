library(assertive.numbers)


### Name: assert_all_numbers_are_whole_numbers
### Title: Is the input a whole number?
### Aliases: assert_all_are_whole_numbers
###   assert_all_numbers_are_whole_numbers assert_any_are_whole_numbers
###   assert_any_numbers_are_whole_numbers is_whole_number

### ** Examples

# 1, plus or minus a very small number
x <- 1 + c(0, .Machine$double.eps, -.Machine$double.neg.eps)
# By default, you get a bit of tolerance for rounding errors
is_whole_number(x)
# Set the tolerance to zero for exact matching.
is_whole_number(x, tol = 0)



