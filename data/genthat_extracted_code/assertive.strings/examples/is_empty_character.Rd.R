library(assertive.strings)


### Name: assert_all_are_empty_character
### Title: Does the input contain empty or missing strings?
### Aliases: assert_all_are_empty_character
###   assert_all_are_missing_or_empty_character
###   assert_all_are_non_empty_character
###   assert_all_are_non_missing_nor_empty_character
###   assert_all_strings_are_not_missing_nor_empty
###   assert_any_are_empty_character
###   assert_any_are_missing_or_empty_character
###   assert_any_are_non_empty_character
###   assert_any_are_non_missing_nor_empty_character
###   assert_any_strings_are_not_missing_nor_empty
###   assert_is_a_missing_or_empty_string assert_is_a_non_empty_string
###   assert_is_a_non_missing_nor_empty_string assert_is_an_empty_string
###   is_a_missing_or_empty_string is_a_non_empty_string
###   is_a_non_missing_nor_empty_string is_an_empty_string
###   is_empty_character is_missing_or_empty_character
###   is_non_empty_character is_non_missing_nor_empty_character
###   is_not_missing_nor_empty_character

### ** Examples

# These functions return a vector:
x <- c("", "a", NA)
is_empty_character(x)
is_non_empty_character(x)
is_missing_or_empty_character(x)
is_non_missing_nor_empty_character(x)

# These functions return a single value:
is_an_empty_string("")
is_an_empty_string("a")
is_an_empty_string(NA_character_)

is_a_non_empty_string("")
is_a_non_empty_string("a")
is_a_non_empty_string(NA_character_)

is_a_missing_or_empty_string("")
is_a_missing_or_empty_string("a")
is_a_missing_or_empty_string(NA_character_)

is_a_non_missing_nor_empty_string("")
is_a_non_missing_nor_empty_string("a")
is_a_non_missing_nor_empty_string(NA_character_)



