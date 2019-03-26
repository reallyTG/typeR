library(kutils)


### Name: safeInteger
### Title: If a numeric variable has only integer values, then make it an
###   integer.
### Aliases: safeInteger

### ** Examples

x1 <- c(1, 2, 3, 4, 5, 6)
is.integer(x1)
is.double(x1)
is.numeric(x1)
(x1int <- safeInteger(x1))
is.integer(x1int)
is.double(x1int)
is.numeric(x1int)
x2 <- rnorm(100)
x2int <- safeInteger(x2)
head(x2int)
x3 <- factor(x1, labels = c(LETTERS[1:6]))
x3int <- safeInteger(x3)




