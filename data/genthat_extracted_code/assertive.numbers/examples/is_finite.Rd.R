library(assertive.numbers)


### Name: assert_all_are_finite
### Title: Are the inputs (in)finite?
### Aliases: assert_all_are_finite assert_all_are_infinite
###   assert_all_are_negative_infinity assert_all_are_positive_infinity
###   assert_any_are_finite assert_any_are_infinite
###   assert_any_are_negative_infinity assert_any_are_positive_infinity
###   is_finite is_infinite is_negative_infinity is_positive_infinity

### ** Examples

x <- c(0, Inf, -Inf, NA, NaN)
is_finite(x)
is_infinite(x)
is_positive_infinity(x)
is_negative_infinity(x)
assert_all_are_finite(1:10)
assert_any_are_finite(c(1, Inf))
assert_all_are_infinite(c(Inf, -Inf))
assertive.base::dont_stop(assert_all_are_finite(c(0, Inf, -Inf, NA, NaN)))



