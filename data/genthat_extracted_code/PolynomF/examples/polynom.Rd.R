library(PolynomF)


### Name: polynom
### Title: Constructor, coercion, predicate and print functions for polynom
###   and polylist objects
### Aliases: polynom as.polynom is.polynom polylist as.polylist is.polylist
###   print.polynom print.polylist
### Keywords: symbolmath

### ** Examples

x <- polynom()  # polynomial 'x'
p <- (x-1)^2 + 10*x^3 + 5*x^4
p
# 1 - 2*x + x^2 + 10*x^3 + 5*x^4 

plot(polylist(p, deriv(p), integral(p)),
    xlim = c(-2, 1), ylim = c(-10, 10))
abline(h=0, lty = "dashed", col = "grey")

print(p, variable = "z", decreasing = TRUE)




