library(polynom)


### Name: Math.polynomial
### Title: Math Group Methods for Polynomials
### Aliases: Math.polynomial
### Keywords: symbolmath

### ** Examples

op <- options(digits=18)
p <- poly.from.values(1:4, (2:5)^2)
## 1 + 2.00000000000001*x + x^2
p <- round(p)
## 1 + 2*x + x^2
options(op)



