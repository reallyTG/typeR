library(assertive.numbers)


### Name: assert_all_are_nan
### Title: Is the input (not) NaN?
### Aliases: assert_all_are_nan assert_all_are_not_nan assert_any_are_nan
###   assert_any_are_not_nan is_nan is_not_nan

### ** Examples

x <- c(0, NaN, NA)
is_nan(x)
is_not_nan(x)
assert_all_are_not_nan(1:10)
assert_any_are_not_nan(x)
assertive.base::dont_stop(assert_all_are_not_nan(x))



