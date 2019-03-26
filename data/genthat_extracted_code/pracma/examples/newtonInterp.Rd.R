library(pracma)


### Name: newtonInterp
### Title: Lagrange and Newtons Interpolation
### Aliases: newtonInterp lagrangeInterp
### Keywords: math

### ** Examples

p <- Poly(c(1, 2, 3))
fp <- function(x) polyval(p, x)

x <- 0:4; y <- fp(x)
xx <- linspace(0, 4, 51)
yy <- lagrangeInterp(x, y, xx)
yy <- newtonInterp(x, y, xx)
## Not run: 
##D ezplot(fp, 0, 4)
##D points(xx, yy)
## End(Not run)



