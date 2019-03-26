library(pracma)


### Name: curvefit
### Title: Parametric Curve Fit
### Aliases: curvefit
### Keywords: fitting

### ** Examples

##  Approximating half circle arc with small perturbations
N <- 50
u <- linspace(0, pi, N)
x <- cos(u) + 0.05 * randn(1, N)
y <- sin(u) + 0.05 * randn(1, N)
n <- 8
cfit1 <- curvefit(u, x, y, n)
## Not run: 
##D plot(x, y, col = "darkgray", pch = 19, asp = 1)
##D xp <- cfit1$xp; yp <- cfit1$yp
##D lines(xp, yp, col="blue")
##D grid()
## End(Not run)

##  Fix the end points at t = 0 and t = pi
U <- c(0, pi)
V <- matrix(c(1, 0, -1, 0), 2, 2, byrow = TRUE)
cfit2 <- curvefit(u, x, y, n, U, V)
## Not run: 
##D xp <- cfit2$xp; yp <- cfit2$yp
##D lines(xp, yp, col="red")
## End(Not run)

## Not run: 
##D ##  Archimedian spiral
##D n <- 8
##D u <- linspace(0, 3*pi, 50)
##D a <- 1.0
##D x <- as.matrix(a*u*cos(u))
##D y <- as.matrix(a*u*sin(u))
##D plot(x, y, type = "p", pch = 19, col = "darkgray", asp = 1)
##D lines(x, y, col = "darkgray", lwd = 3)
##D cfit <- curvefit(u, x, y, n)
##D px <- c(cfit$px); py <- c(cfit$py)
##D v <- linspace(0, 3*pi, 200)
##D xs <- polyval(px, v)
##D ys <- polyval(py, v)
##D lines(xs, ys, col = "navy")
##D grid()
## End(Not run)



