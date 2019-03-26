library(PolynomF)


### Name: c.polylist
### Title: Utility methods for manipulating polylist objects
### Aliases: c.polylist c.polynom rep.polylist rep.polynom unique.polylist
### Keywords: symbolmath

### ** Examples

p <- poly.from.zeros(-3:4)
p5 <- rep(polylist(p), 5)
p5
p6 <- c(p, p5)
p6
unique(p6)



