library(VSURF)


### Name: VSURF
### Title: Variable Selection Using Random Forests
### Aliases: VSURF VSURF.default VSURF.formula

### ** Examples


data(iris)
iris.vsurf <- VSURF(iris[,1:4], iris[,5], ntree = 100, nfor.thres = 20,
                    nfor.interp = 10, nfor.pred = 10)
iris.vsurf

## Not run: 
##D # A more interesting example with toys data (see \code{toys})
##D # (a few minutes to execute)
##D data(toys)
##D toys.vsurf <- VSURF(toys$x, toys$y)
##D toys.vsurf
##D 
##D # VSURF run on 2 cores in parallel (using a SOCKET cluster):
##D data(toys)
##D toys.vsurf.parallel <- VSURF(toys$x, toys$y, parallel = TRUE, ncores = 2)
## End(Not run)




