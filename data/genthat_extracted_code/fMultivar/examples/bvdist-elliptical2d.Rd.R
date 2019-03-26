library(fMultivar)


### Name: bvdist-elliptical2d
### Title: Bivariate Elliptical Densities
### Aliases: elliptical2d delliptical2d
### Keywords: math

### ** Examples

## delliptical2d -
   # Kotz' Elliptical Density:
   x <- (-40:40)/10
   X <- grid2d(x)
   z <- delliptical2d(X$x, X$y, rho = 0.5, type = "kotz")
   Z <- list(x = x, y = x, z = matrix(z, ncol = length(x)))
   
## Perspective Plot:
   persp(Z, theta = -40, phi = 30, col = "steelblue")
   
## Image Plot with Contours:
   image(Z, main = "Bivariate Kotz")
   contour(Z, add=TRUE)
   
## Internal Density Slider:
   ## Not run: 
##D    .delliptical2dSlider()
##D    
## End(Not run)



