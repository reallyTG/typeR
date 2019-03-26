library(fMultivar)


### Name: bvdist-cauchy2d
### Title: Bivariate Cauchy Distribution
### Aliases: cauchy2d dcauchy2d pcauchy2d rcauchy2d
### Keywords: math

### ** Examples

## Bivariate Cauchy Density:
   x <- (-40:40)/10
   X <- grid2d(x)
   z <- dcauchy2d(X$x, X$y, rho = 0.5)
   Z <- list(x = x, y = x, z = matrix(z, ncol = length(x)))
   
## Perspective Density Plot:
   persp(Z, theta = -40, phi = 30, col = "steelblue")
   
## Image Density Plot with Contours:
   image(Z, main="Bivariate Cauchy")
   contour(Z, add=TRUE)



