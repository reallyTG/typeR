library(VSURF)


### Name: tune
### Title: Tuning of the thresholding and interpretation steps of VSURF
### Aliases: tune tune.VSURF_thres tune.VSURF_interp

### ** Examples


## Not run: 
##D data(iris)
##D iris.thres <- VSURF_thres(iris[,1:4], iris[,5], ntree = 100, nfor.thres = 20)
##D iris.thres.tuned <- tune(iris.thres, nmin = 10)
##D iris.thres.tuned
##D iris.interp <- VSURF_interp(iris[,1:4], iris[,5], vars = iris.thres$varselect.thres,
##D                             nfor.interp = 10)
##D iris.interp.tuned <- tune(iris.interp, nsd = 10)
##D iris.interp.tuned
## End(Not run)




