library(httr)


### Name: insensitive
### Title: Create a vector with case insensitive name matching.
### Aliases: insensitive
### Keywords: internal

### ** Examples

x <- c("abc" = 1, "def" = 2)
x["ABC"]
y <- insensitive(x)
y["ABC"]
y[["ABC"]]



