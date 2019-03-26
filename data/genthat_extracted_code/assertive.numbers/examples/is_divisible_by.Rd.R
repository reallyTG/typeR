library(assertive.numbers)


### Name: assert_all_are_divisible_by
### Title: Is the input divisible by a number?
### Aliases: assert_all_are_divisible_by assert_all_are_even
###   assert_all_are_odd assert_any_are_divisible_by assert_any_are_even
###   assert_any_are_odd is_divisible_by is_even is_odd

### ** Examples

is_divisible_by(1:10, 3)
is_divisible_by(-5:5, -2)
is_divisible_by(1.5:10.5, c(1.5, 3.5))
assert_any_are_even(1:10)
assertive.base::dont_stop(assert_all_are_even(1:10))



