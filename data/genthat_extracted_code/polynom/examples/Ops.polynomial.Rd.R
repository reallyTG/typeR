library(polynom)


### Name: Ops.polynomial
### Title: Arithmetic Ops Group Methods for Polynomials
### Aliases: Ops.polynomial
### Keywords: symbolmath

### ** Examples

p <- polynomial(c(1, 2, 1))
## 1 + 2*x + x^2
r <- poly.calc(-1 : 1)
## -1*x + x^3
(r - 2 * p)^2
## 4 + 20*x + 33*x^2 + 16*x^3 - 6*x^4 - 4*x^5 + x^6



