library(matlab)


### Name: reshape
### Title: MATLAB reshape function
### Aliases: reshape
### Keywords: array

### ** Examples

Xmat.2d <- matrix(1:12, nrow=4, ncol=3)
reshape(Xmat.2d, 6, 2)                   # example 1
reshape(Xmat.2d, c(6, 2))                    # same thing
Xarr.3d <- reshape(Xmat.2d, c(6, 2, 1))  # example 2
reshape(Xmat.2d, size(Xarr.3d))          # example 3



