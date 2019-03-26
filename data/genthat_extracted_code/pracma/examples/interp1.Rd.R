library(pracma)


### Name: interp1
### Title: One-dimensional Interpolation
### Aliases: interp1
### Keywords: math

### ** Examples

x <- c(0.8, 0.3, 0.1, 0.6, 0.9, 0.5, 0.2, 0.0, 0.7, 1.0, 0.4)
y <- x^2
xi <- seq(0, 1, len = 81)
yl <- interp1(x, y, xi, method = "linear")
yn <- interp1(x, y, xi, method = "nearest")
ys <- interp1(x, y, xi, method = "spline")

## Not run: 
##D plot(x, y); grid()
##D lines(xi, yl, col="blue", lwd = 2)
##D lines(xi, yn, col="black", lty = 2)
##D lines(xi, ys, col="red")
##D   
## End(Not run)

## Difference between spline (Matlab) and spline (R).
x <- 1:6
y <- c(16, 18, 21, 17, 15, 12)
xs <- linspace(1, 6, 51)
ys <- interp1(x, y, xs, method = "spline")
sp <- spline(x, y, n = 51, method = "fmm")

## Not run: 
##D plot(x, y, main = "Matlab and R splines")
##D grid()
##D lines(xs, ys, col = "red")
##D lines(sp$x, sp$y, col = "blue")
##D legend(4, 20, c("Matlab spline", "R spline"), 
##D               col = c("red", "blue"), lty = 1)
##D   
## End(Not run)



