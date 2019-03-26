library(pracma)


### Name: cubicspline
### Title: Interpolating Cubic Spline
### Aliases: cubicspline
### Keywords: fitting

### ** Examples

##  Example: Average temperatures at different latitudes
x <- seq(-55, 65, by = 10)
y <- c(-3.25, -3.37, -3.35, -3.20, -3.12, -3.02, -3.02,
       -3.07, -3.17, -3.32, -3.30, -3.22, -3.10)
xs <- seq(-60, 70, by = 1)

# Generate a function for this
pp <- cubicspline(x, y)
ppfun <- function(xs) ppval(pp, xs)

## Not run: 
##D # Plot with and without endpoint correction
##D plot(x, y, col = "darkblue",
##D            xlim = c(-60, 70), ylim = c(-3.5, -2.8),
##D            xlab = "Latitude", ylab = "Temp. Difference",
##D            main = "Earth Temperatures per Latitude")
##D lines(spline(x, y), col = "darkgray")
##D grid()
##D 
##D ys <- cubicspline(x, y, xs, endp2nd = TRUE)     # der = 0 at endpoints
##D lines(xs, ys, col = "red")
##D ys <- cubicspline(x, y, xs)                     # no endpoint condition
##D lines(xs, ys, col = "darkred")
## End(Not run)



