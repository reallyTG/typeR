library(VSURF)


### Name: VSURF_thres
### Title: Thresholding step of VSURF
### Aliases: VSURF_thres VSURF_thres.default VSURF_thres.formula

### ** Examples


data(iris)
iris.thres <- VSURF_thres(iris[,1:4], iris[,5], ntree = 100, nfor.thres = 20)
iris.thres

## Not run: 
##D # A more interesting example with toys data (see \code{toys})
##D # (a few minutes to execute)
##D data(toys)
##D toys.thres <- VSURF_thres(toys$x, toys$y)
##D toys.thres
## End(Not run)




