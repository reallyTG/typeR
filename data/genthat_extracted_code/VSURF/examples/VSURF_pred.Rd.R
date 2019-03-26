library(VSURF)


### Name: VSURF_pred
### Title: Prediction step of VSURF
### Aliases: VSURF_pred VSURF_pred.default VSURF_pred.formula

### ** Examples


data(iris)
iris.thres <- VSURF_thres(iris[,1:4], iris[,5], ntree = 100, nfor.thres = 20)
iris.interp <- VSURF_interp(iris[,1:4], iris[,5], vars = iris.thres$varselect.thres,
                            nfor.interp = 10)
iris.pred <- VSURF_pred(iris[,1:4], iris[,5], err.interp = iris.interp$err.interp,
                        varselect.interp = iris.interp$varselect.interp, nfor.pred = 10)
iris.pred

## Not run: 
##D # A more interesting example with toys data (see \code{toys})
##D # (a few minutes to execute)
##D data(toys)
##D toys.thres <- VSURF_thres(toys$x, toys$y)
##D toys.interp <- VSURF_interp(toys$x, toys$y, vars = toys.thres$varselect.thres)
##D toys.pred <- VSURF_pred(toys$x, toys$y, err.interp = toys.interp$err.interp,
##D                         varselect.interp = toys.interp$varselect.interp)
##D toys.pred
## End(Not run)




