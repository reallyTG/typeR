library(VSURF)


### Name: summary.VSURF
### Title: Summary of VSURF results
### Aliases: summary.VSURF

### ** Examples


## Not run: 
##D data(iris)
##D iris.vsurf <- VSURF(iris[,1:4], iris[,5], ntree = 100, nfor.thres = 20,
##D                     nfor.interp = 10, nfor.pred = 10)
##D summary(iris.vsurf)
##D 
##D # A more interesting example with toys data (see \code{toys})
##D # (a few minutes to execute)
##D data(toys)
##D toys.vsurf <- VSURF(toys$x, toys$y)
##D summary(toys.vsurf)
## End(Not run)




