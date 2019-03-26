library(assertive.numbers)


### Name: assert_all_are_equal_to
### Title: How does the input relate to a value?
### Aliases: assert_all_are_equal_to assert_all_are_greater_than
###   assert_all_are_greater_than_or_equal_to assert_all_are_less_than
###   assert_all_are_less_than_or_equal_to assert_all_are_not_equal_to
###   assert_any_are_equal_to assert_any_are_greater_than
###   assert_any_are_greater_than_or_equal_to assert_any_are_less_than
###   assert_any_are_less_than_or_equal_to assert_any_are_not_equal_to
###   is_equal_to is_greater_than is_greater_than_or_equal_to is_less_than
###   is_less_than_or_equal_to is_not_equal_to

### ** Examples

# Approximate and exact floating point comparisons:
# See FAQ on R 7.31
x <- sqrt(2) * sqrt(2)
is_equal_to(x, 2)
is_equal_to(x, 2, tol = 0)
is_not_equal_to(x, 2)
is_not_equal_to(x, 2, tol = 0)

# Elements of x and y are recycled
is_equal_to(1:6, 1:3)

# Inequalities
x <- c(1 - .Machine$double.neg.eps, 1, 1 + .Machine$double.eps)
is_greater_than(x, 1)
is_greater_than_or_equal_to(x, 1)
is_less_than(x, 1)
is_less_than_or_equal_to(x, 1)



