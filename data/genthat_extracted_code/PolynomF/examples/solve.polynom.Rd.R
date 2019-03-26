library(PolynomF)


### Name: solve.polynom
### Title: Find roots of polynomial equations
### Aliases: solve.polynom solve.polylist
### Keywords: symbolmath

### ** Examples

x <- polynom()
H <- polylist(1, x)
for(n in 2:10)
    H[[n+1]] <- x * H[[n]] - (n-1)*H[[n-1]]
solve(H)
solve(deriv(H))




