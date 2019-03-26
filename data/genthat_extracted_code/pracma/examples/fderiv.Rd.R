library(pracma)


### Name: fderiv
### Title: Numerical Differentiation
### Aliases: fderiv
### Keywords: math

### ** Examples

## Not run: 
##D f <- sin
##D xs <- seq(-pi, pi, length.out = 100)
##D ys <- f(xs)
##D y1 <- fderiv(f, xs, n = 1, method = "backward")
##D y2 <- fderiv(f, xs, n = 2, method = "backward")
##D y3 <- fderiv(f, xs, n = 3, method = "backward")
##D y4 <- fderiv(f, xs, n = 4, method = "backward")
##D plot(xs, ys, type = "l", col = "gray", lwd = 2,
##D      xlab = "", ylab = "", main = "Sinus and its Derivatives")
##D lines(xs, y1, col=1, lty=2)
##D lines(xs, y2, col=2, lty=3)
##D lines(xs, y3, col=3, lty=4)
##D lines(xs, y4, col=4, lty=5)
##D grid()
## End(Not run)



