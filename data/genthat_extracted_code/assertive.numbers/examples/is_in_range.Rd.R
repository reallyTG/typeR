library(assertive.numbers)


### Name: assert_all_are_in_closed_range
### Title: Is the input in range?
### Aliases: assert_all_are_in_closed_range
###   assert_all_are_in_left_open_range assert_all_are_in_open_range
###   assert_all_are_in_range assert_all_are_in_right_open_range
###   assert_all_are_negative assert_all_are_non_negative
###   assert_all_are_non_positive assert_all_are_percentages
###   assert_all_are_positive assert_all_are_proportions
###   assert_any_are_in_closed_range assert_any_are_in_left_open_range
###   assert_any_are_in_open_range assert_any_are_in_range
###   assert_any_are_in_right_open_range assert_any_are_negative
###   assert_any_are_non_negative assert_any_are_non_positive
###   assert_any_are_percentages assert_any_are_positive
###   assert_any_are_proportions is_in_closed_range is_in_left_open_range
###   is_in_open_range is_in_range is_in_right_open_range is_negative
###   is_non_negative is_non_positive is_percentage is_positive
###   is_proportion

### ** Examples

assert_all_are_positive(1:10)
assert_all_are_non_negative(0:10)
assert_any_are_positive(c(-1, 1))
assert_all_are_percentages(c(0, 50, 100))
assert_all_are_proportions(c(0, 0.5, 1))
assert_all_are_in_left_open_range(1 + .Machine$double.eps, lower = 1)



