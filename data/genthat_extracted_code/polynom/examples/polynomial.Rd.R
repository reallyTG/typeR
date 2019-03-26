library(polynom)


### Name: polynomial
### Title: Polynomials
### Aliases: polynomial as.polynomial is.polynomial as.character.polynomial
###   print.polynomial coef.polynomial
### Keywords: symbolmath

### ** Examples

polynomial(1:4)
p <- as.polynomial(c(1,0,3,0))
p
print(p, decreasing = TRUE)
stopifnot(coef(p) == c(1,0,3))

polynomial(c(2,rep(0,10),1))



