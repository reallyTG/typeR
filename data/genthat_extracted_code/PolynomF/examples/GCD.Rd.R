library(PolynomF)


### Name: GCD
### Title: GCD and LCM or two or more polynomials
### Aliases: GCD GCD.polynom GCD.polylist LCM LCM.polynom LCM.polylist
### Keywords: symbolmath

### ** Examples

p1 <- poly.from.zeros(-3:2)
p2 <- poly.from.zeros(0:4)

pgcd <- GCD(p1, p2)

pl <- polylist(p1, p2)
plcm <- LCM(pl)

polylist(pgcd, plcm)




