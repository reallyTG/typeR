library(ETLUtils)


### Name: factorise
### Title: Put character vectors, columns of a data.frame or list elements
###   as factor
### Aliases: factorise factorise.default factorise.character
###   factorise.data.frame factorise.list

### ** Examples

x <- data.frame(x = 1:4, y = LETTERS[1:4], b = c(TRUE, FALSE, NA, TRUE), stringsAsFactors=FALSE)
str(factorise(x))
str(factorise(x, logicals = TRUE))
str(factorise(list(a = LETTERS, b = 1:10, c = pi, d = list(x = x))))



