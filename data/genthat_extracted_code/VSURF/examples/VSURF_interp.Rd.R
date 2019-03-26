library(VSURF)


### Name: VSURF_interp
### Title: Interpretation step of VSURF
### Aliases: VSURF_interp VSURF_interp.default VSURF_interp.formula

### ** Examples


data(iris)
iris.thres <- VSURF_thres(iris[,1:4], iris[,5], ntree = 100, nfor.thres = 20)
iris.interp <- VSURF_interp(iris[,1:4], iris[,5], vars = iris.thres$varselect.thres,
                            nfor.interp = 10)
iris.interp

## Not run: 
##D # A more interesting example with toys data (see \code{toys})
##D # (a few minutes to execute)
##D data(toys)
##D toys.thres <- VSURF_thres(toys$x, toys$y)
##D toys.interp <- VSURF_interp(toys$x, toys$y, vars = toys.thres$varselect.thres)
##D toys.interp
## End(Not run)




