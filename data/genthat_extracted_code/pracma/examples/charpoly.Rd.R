library(pracma)


### Name: charpoly
### Title: Characteristic Polynomial
### Aliases: charpoly
### Keywords: array

### ** Examples

a <- magic(5)
A <- charpoly(a, info = TRUE)
A$cp
roots(A$cp)
A$det
zapsmall(A$inv %*% a)



