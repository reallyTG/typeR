library(polynom)


### Name: poly.calc
### Title: Calculate Polynomials from Zeros or Values
### Aliases: poly.calc poly.from.zeros poly.from.roots poly.from.values
### Keywords: symbolmath

### ** Examples

poly.calc(rep(1,3))
## -1 + 3*x - 3*x^2 + x^3 
poly.calc(0:4, (0:4)^2 + 1)
## 1 + x^2 
poly.calc(0:4, cbind(0:4, (0:4)^2 + 1), lab = letters[1:2])
## List of polynomials:
## $a:
## x
##
## $b:
## 1 + x^2 



