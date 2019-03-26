library(assertive.strings)


### Name: assert_all_are_numeric_strings
### Title: Does the string contain a number/logical value?
### Aliases: assert_all_are_logical_strings assert_all_are_numeric_strings
###   assert_any_are_logical_strings assert_any_are_numeric_strings
###   is_logical_string is_numeric_string

### ** Examples

is_numeric_string(c("1", "1.1", "-1.1e1", "one", NA))
# R only treats certain capitalizations of "true" and "false" as logical
x <- c(
  "TRUE", "FALSE", "true", "false", "True", "False", "trUE", "FaLsE", 
  "T", "F", "t", "f"
)
is_logical_string(x)

assert_all_are_numeric_strings(c("1", "2.3", "-4.5", "6e7", "8E-9"))
assert_any_are_numeric_strings(c("1", "Not a number"))



