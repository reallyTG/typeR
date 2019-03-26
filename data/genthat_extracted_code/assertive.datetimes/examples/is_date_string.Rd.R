library(assertive.datetimes)


### Name: assert_all_are_date_strings
### Title: Does the character vector contain dates?
### Aliases: assert_all_are_date_strings assert_any_are_date_strings
###   is_date_string

### ** Examples

x <- c("9999-12-31 23:59:59", "wednesday", NA)
is_date_string(x)
assert_all_are_date_strings("01Aug1979", format = "%d%b%Y") #My DOB!



