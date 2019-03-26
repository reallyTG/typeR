library(pracma)


### Name: ratinterp
### Title: Rational Interpolation
### Aliases: ratinterp
### Keywords: fitting

### ** Examples

## Rational interpolation of Runge's function
x <- c(-1, -0.5, 0, 0.5, 1.0)
y <- runge(x)
xs <- linspace(-1, 1)
ys <- runge(xs)
yy <- ratinterp(x, y, xs)  # returns exactly the Runge function

## Not run: 
##D plot(xs, ys, type="l", col="blue", lty = 2, lwd = 3)
##D points(x, y)
##D yy <- ratinterp(x, y, xs)
##D lines(xs, yy, col="red")
##D grid()
## End(Not run)



