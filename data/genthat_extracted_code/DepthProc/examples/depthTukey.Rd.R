library(DepthProc)


### Name: depthTukey
### Title: Tukey Depth
### Aliases: depthTukey
### Keywords: depth function multivariate nonparametric

### ** Examples

## Not run: 
##D x <- matrix(rnorm(3000), nc = 3)
##D depthTukey(x, ndir = 2000)
## End(Not run)

# Exact algorithm in 2d
x <- matrix(rnorm(2000), nc = 2)
depthTukey(x, exact = TRUE)




