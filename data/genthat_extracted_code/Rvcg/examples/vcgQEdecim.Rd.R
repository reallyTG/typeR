library(Rvcg)


### Name: vcgQEdecim
### Title: Performs Quadric Edge Decimation on triangular meshes.
### Aliases: vcgQEdecim
### Keywords: ~kwd1 ~kwd2

### ** Examples



data(humface)
##reduce faces to 50% 
decimface <- vcgQEdecim(humface, percent=0.5)
## view
## Not run: 
##D require(rgl)
##D shade3d(decimface, col=3)
##D 
##D ## some light smoothing
##D decimface <- vcgSmooth(decimface,iteration = 1)
## End(Not run) 



