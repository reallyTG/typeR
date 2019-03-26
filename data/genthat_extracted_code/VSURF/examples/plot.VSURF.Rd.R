library(VSURF)


### Name: plot.VSURF
### Title: Plot of VSURF results
### Aliases: plot.VSURF plot.VSURF_thres plot.VSURF_interp plot.VSURF_pred

### ** Examples


## Not run: 
##D data(iris)
##D iris.vsurf <- VSURF(iris[,1:4], iris[,5])
##D plot(iris.vsurf)
##D plot(iris.vsurf, var.names=TRUE)
##D plot(iris.vsurf, step="thres")
##D 
##D # A more interesting example with toys data (see \code{toys})
##D # (a few minutes to execute) and intermediate functions
##D data(toys)
##D toys.vsurf <- VSURF(toys$x, toys$y)
##D plot(toys.vsurf)
##D plot(toys.vsurf, nvar.imp.mean = 50, nvar.imp.sd = 50)
##D toys.thres <- VSURF_thres(toys$x, toys$y)
##D plot(toys.thres)
##D plot(toys.thres, nvar.imp.mean = 70, imp.sd = FALSE)
##D toys.interp <- VSURF_interp(toys$x, toys$y, vars = toys.thres$varselect.thres)
##D plot(toys.interp, var.names = TRUE)
##D toys.pred <- VSURF_pred(toys$x, toys$y, err.interp = toys.interp$err.interp,
##D                         varselect.interp = toys.interp$varselect.interp)
##D plot(toys.pred, var.names = TRUE)
## End(Not run)




