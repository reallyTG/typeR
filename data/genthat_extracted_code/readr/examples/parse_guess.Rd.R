library(readr)


### Name: parse_guess
### Title: Parse using the "best" type
### Aliases: parse_guess col_guess guess_parser

### ** Examples

# Logical vectors
parse_guess(c("FALSE", "TRUE", "F", "T"))

# Integers and doubles
parse_guess(c("1","2","3"))
parse_guess(c("1.6","2.6","3.4"))

# Numbers containing grouping mark
guess_parser("1,234,566")
parse_guess("1,234,566")

# ISO 8601 date times
guess_parser(c("2010-10-10"))
parse_guess(c("2010-10-10"))



