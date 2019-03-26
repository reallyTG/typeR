library(rebus.base)


### Name: recursive
### Title: Make the regular expression recursive.
### Aliases: recursive

### ** Examples

recursive("a")

# Recursion isn't supported by R's PRCE engine or
# stringi/stringr's ICU engine
x <- c("ab222z", "ababz", "ab", "abab")
rx <- "ab(?R)?z"
grepl(rx, x, perl = TRUE)
try(grepl(rx, x))
try(stringi::stri_detect_regex(x, rx))



