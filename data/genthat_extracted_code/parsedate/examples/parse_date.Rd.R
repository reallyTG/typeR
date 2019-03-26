library(parsedate)


### Name: parse_date
### Title: Parse date from any format
### Aliases: parse_date

### ** Examples

# Some easy examples
parse_date("2014-12-12")
parse_date("04/15/99")
parse_date("15/04/99")

# Ambiguous format, parsed assuming MM/DD/YY
parse_date("12/11/99")
parse_date("11/12/99")

# Fill in the current date and time
parse_date("03/20")
parse_date("12")

# But not for this, because this is ISO 8601
parse_date("2014")

# Handle vectors and empty input
parse_date(c("2014","2015","","2016"))



