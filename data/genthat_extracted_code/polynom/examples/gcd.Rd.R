library(polynom)


### Name: gcd
### Title: GCD and LCM for Polynomials
### Aliases: GCD GCD.polylist GCD.polynomial LCM LCM.polylist
###   LCM.polynomial
### Keywords: symbolmath

### ** Examples

pl <- polylist(poly.from.roots(-1),
               poly.from.roots(c(-1, -1)),
               poly.from.roots(1))
GCD(pl)
GCD(pl[-3])
LCM(pl)
LCM(pl, pl, pl[[2]])



