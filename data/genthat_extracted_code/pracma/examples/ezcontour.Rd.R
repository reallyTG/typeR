library(pracma)


### Name: ezcontour,ezsurf,ezmesh
### Title: Contour, Surface, and Mesh Plotter
### Aliases: ezcontour ezsurf ezmesh
### Keywords: graphs

### ** Examples

## Not run: 
##D f <- function(xy) {
##D     x <- xy[1]; y <- xy[2]
##D     3*(1-x)^2 * exp(-(x^2) - (y+1)^2) -
##D         10*(x/5 - x^3 - y^5) * exp(-x^2 - y^2) -
##D         1/3 * exp(-(x+1)^2 - y^2)
##D     }
##D ezcontour(f, col = "navy")
##D ezcontour(f, filled = TRUE)
##D ezmesh(f)
##D ezmesh(f, col="lightblue", theta = -15, phi = 30)
##D   
## End(Not run)



