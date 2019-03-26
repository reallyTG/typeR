library(PolynomF)


### Name: integral
### Title: Integral and differential calculus on polynomials or lists of
###   polynomials.
### Aliases: integral integral.polynom integral.polylist deriv.polynom
###   deriv.polylist
### Keywords: symbolmath

### ** Examples

p <- poly.from.zeros(-2:5)
ip <- integral(p)
ipv <- integral(p, limits = c(-2, 5))

plot(polylist(p, deriv(p)))

x <- polynom()
H <- polylist(1, x)
for(n in 2:10)
    H[[n+1]] <- x * H[[n]] - (n-1)*H[[n-1]]

solve(deriv(H))




