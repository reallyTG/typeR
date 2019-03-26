library(rebus.base)


### Name: repeated
### Title: Repeat values
### Aliases: repeated optional lazy zero_or_more one_or_more

### ** Examples

# Can match constants or class values
repeated(GRAPH, 2, 5)
repeated(graph(), 2, 5)   # same

# Short cuts for special cases
optional(blank())         # same as repeated(blank(), 0, 1)
zero_or_more(hex_digit()) # same as repeated(hex_digit(), 0, Inf)
one_or_more(printable())  # same as repeated(printable(), 1, Inf)

# 'Lazy' matching (match smallest no. of chars)
repeated(cntrl(), 2, 5, lazy = TRUE)
lazy(one_or_more(cntrl()))

# Overriding character class wrapping
repeated(ANY_CHAR, 2, 5, char_class = FALSE)

# Usage
x <- "1234567890"
stringi::stri_extract_first_regex(x, one_or_more(DIGIT))
stringi::stri_extract_first_regex(x, repeated(DIGIT, lo = 3, hi = 6))
stringi::stri_extract_first_regex(x, lazy(repeated(DIGIT, lo = 3, hi = 6)))

col <- c("color", "colour")
stringi::stri_detect_regex(col, "colo" %R% optional("u") %R% "r")



