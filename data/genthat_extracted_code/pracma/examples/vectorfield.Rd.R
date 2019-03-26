library(pracma)


### Name: vectorfield
### Title: Vector Field Plotting
### Aliases: vectorfield
### Keywords: graphs

### ** Examples

f <- function(x, y) x^2 - y^2
xx <- c(-1, 1); yy <- c(-1, 1)
## Not run: 
##D vectorfield(f, xx, yy, scale = 0.1)
##D for (xs in seq(-1, 1, by = 0.25)) {
##D     sol <- rk4(f, -1, 1, xs, 100)
##D     lines(sol$x, sol$y, col="darkgreen")
##D }
##D grid()
## End(Not run)



