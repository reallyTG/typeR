library(spatstat)


### Name: affine.owin
### Title: Apply Affine Transformation To Window
### Aliases: affine.owin
### Keywords: spatial math

### ** Examples

  # shear transformation
  shear <- matrix(c(1,0,0.6,1),ncol=2)
  X <- affine(owin(), shear)
  ## Not run: 
##D   plot(X)
##D   
## End(Not run)
  data(letterR)
  affine(letterR, shear, c(0, 0.5))
  affine(as.mask(letterR), shear, c(0, 0.5))



