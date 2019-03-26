library(spatstat)


### Name: affine.ppp
### Title: Apply Affine Transformation To Point Pattern
### Aliases: affine.ppp
### Keywords: spatial math

### ** Examples

  data(cells)
  # shear transformation
  X <- affine(cells, matrix(c(1,0,0.6,1),ncol=2))
  ## Not run: 
##D   plot(X)
##D   # rescale y coordinates by factor 1.3
##D   plot(affine(cells, diag(c(1,1.3))))
##D   
## End(Not run)



