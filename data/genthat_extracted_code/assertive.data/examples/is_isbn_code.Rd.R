library(assertive.data)


### Name: assert_all_are_isbn_codes
### Title: Does the character vector contain ISBN book codes?
### Aliases: assert_all_are_isbn_codes assert_any_are_isbn_codes
###   is_isbn10_code is_isbn13_code is_isbn_code

### ** Examples

x10 <- c(
  hyphens             = "0-387-98503-4",
  spaces              = "0 387 98503 4",
  just_numbers        = "0387985034",
  too_long            = "00-387-98503-4",
  too_short           = "0-387-9850-4",
  non_numeric         = "Z-387-98503-4",
  invalid_check_digit = "0-387-98503-5",
  missing             = NA
)
x13 <- c(
  hyphens             = "978-0-387-98503-9",
  spaces              = "978 0 387 98503 9",
  just_numbers        = "9780387985039",
  too_long            = "9978-0-387-98503-9",
  too_short           = "978-0-387-9850-9",
  non_numeric         = "Z78-0-387-9850-9",
  invalid_check_digit = "978-0-387-98503-8",
  missing             = NA
)
is_isbn_code(x10, type = "10")
assert_any_are_isbn_codes(x10, type = "10")
is_isbn_code(x13, type = "13")
assert_any_are_isbn_codes(x13, type = "13")
# These checks should fail.
assertive.base::dont_stop(assert_all_are_isbn_codes(x10, type = "10"))
assertive.base::dont_stop(assert_all_are_isbn_codes(x13, type = "13"))



