library(fMultivar)


### Name: bvdist-t2d
### Title: Bivariate Student-t Distribution
### Aliases: t2d dt2d pt2d rt2d
### Keywords: math

### ** Examples

## dt2d -
   # Bivariate Student-t Density:
   x <- (-40:40)/10
   X <- grid2d(x)
   z <- dt2d(X$x, X$y, rho = 0.5, nu = 6)
   Z <- list(x = x, y = x, z = matrix(z, ncol = length(x)))
   # Perspective Plot:
   persp(Z, theta = -40, phi = 30, col = "steelblue")
   # Contour Plot:
   contour(Z)
   
## pt2d -
   # Bivariate Student-t Probability:
   x <- (-40:40)/10
   X <- grid2d(x)
   z <- pt2d(X$x, X$y, rho = 0.5, nu = 6)
   Z <- list(x = x, y = x, z = matrix(z, ncol = length(x)))
   # Image Plot with Contours:
   image(Z)
   contour(Z, add=TRUE)



