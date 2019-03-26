library(readr)


### Name: parse_atomic
### Title: Parse logicals, integers, and reals
### Aliases: parse_logical parse_integer parse_double parse_character
###   col_logical col_integer col_double col_character

### ** Examples

parse_integer(c("1", "2", "3"))
parse_double(c("1", "2", "3.123"))
parse_number("$1,123,456.00")

# Use locale to override default decimal and grouping marks
es_MX <- locale("es", decimal_mark = ",")
parse_number("$1.123.456,00", locale = es_MX)

# Invalid values are replaced with missing values with a warning.
x <- c("1", "2", "3", "-")
parse_double(x)
# Or flag values as missing
parse_double(x, na = "-")



