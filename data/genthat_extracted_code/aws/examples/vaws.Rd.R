library(aws)


### Name: vaws
### Title: vector valued version of function 'aws' The function implements
###   the propagation separation approach to nonparametric smoothing
###   (formerly introduced as Adaptive weights smoothing) for varying
###   coefficient likelihood models with vector valued response on a 1D, 2D
###   or 3D grid.
### Aliases: vaws vawscov
### Keywords: smooth nonparametric regression

### ** Examples
## Not run: 
##D setCores(2)
##D y <- array(rnorm(4*64^3),c(4,64,64,64))
##D yhat <- vaws(y,kstar=20)
## End(Not run)




