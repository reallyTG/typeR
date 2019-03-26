library(pracma)


### Name: gradient
### Title: Discrete Gradient (Matlab Style)
### Aliases: gradient
### Keywords: math

### ** Examples

x <- seq(0, 1, by=0.2)
y <- c(1, 2, 3)
(M <- meshgrid(x, y))
gradient(M$X^2 + M$Y^2)
gradient(M$X^2 + M$Y^2, x, y)

## Not run: 
##D # One-dimensional example
##D x <- seq(0, 2*pi, length.out = 100)
##D y <- sin(x)
##D f <- gradient(y, x)
##D max(f - cos(x))      #=> 0.00067086
##D plot(x, y, type = "l", col = "blue")
##D lines(x, cos(x), col = "gray", lwd = 3)
##D lines(x, f, col = "red")
##D grid()
##D 
##D # Two-dimensional example
##D v <- seq(-2, 2, by=0.2)
##D X <- meshgrid(v, v)$X
##D Y <- meshgrid(v, v)$Y
##D 
##D Z <- X * exp(-X^2 - Y^2)
##D image(v, v, t(Z))
##D contour(v, v, t(Z), col="black", add = TRUE)
##D grid(col="white")
##D 
##D grX <- gradient(Z, v, v)$X
##D grY <- gradient(Z, v, v)$Y
##D 
##D quiver(X, Y, grX, grY, scale = 0.2, col="blue")
## End(Not run)



