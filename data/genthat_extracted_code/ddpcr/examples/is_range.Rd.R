library(ddpcr)


### Name: is_range
### Title: Is the given parameter a range?
### Aliases: is_range
### Keywords: internal

### ** Examples

is_range("C05")            # FALSE
is_range(c("C05", "F05"))  # FALSE
is_range("C05")            # FALSE
is_range("C05, F05")       # TRUE
is_range("C05:F05")        # TRUE
is_range("C05.F05")        # FALSE



