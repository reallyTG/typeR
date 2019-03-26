library(pracma)


### Name: chebApprox
### Title: Chebyshev Approximation
### Aliases: chebApprox
### Keywords: math

### ** Examples

# Approximate sin(x) on [-pi, pi] with a polynomial of degree 9 !
# This polynomial has to be beaten:
# P(x) = x - 1/6*x^3 + 1/120*x^5 - 1/5040*x^7 + 1/362880*x^9

# Compare these polynomials
p1 <- rev(c(0, 1, 0, -1/6, 0, 1/120, 0, -1/5040, 0, 1/362880))
p2 <- chebCoeff(sin, -pi, pi, 9)

# Estimate the maximal distance
x  <- seq(-pi, pi, length.out = 101)
ys <- sin(x)
yp <- polyval(p1, x)
yc <- chebApprox(x, sin, -pi, pi, 9)
max(abs(ys-yp))                       # 0.006925271
max(abs(ys-yc))                       # 1.151207e-05

## Not run: 
##D # Plot the corresponding curves
##D plot(x, ys, type = "l", col = "gray", lwd = 5)
##D lines(x, yp, col = "navy")
##D lines(x, yc, col = "red")
##D grid()
## End(Not run)



