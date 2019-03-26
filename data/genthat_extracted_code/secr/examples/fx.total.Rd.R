library(secr)


### Name: fx.total
### Title: Activity Centres of Detected and Undetected Animals
### Aliases: fx.total
### Keywords: model

### ** Examples


## Not run: 
##D 
##D tmp <- fx.total(secrdemo.0)
##D 
##D ## to plot we must name one of the covariates:
##D ## the Dsurface default 'D.0' causes an error 
##D 
##D plot(tmp, covariate = 'D.sum', col = terrain.colors(16),
##D    plottype = 'shaded')
##D plot(tmp, covariate = 'D.sum', col = 'white', add = TRUE,
##D    plottype = 'contour')
##D spotHeight(tmp, prefix = 'D.sum')
##D 
##D fxsurface <- fx.total(ovenbird.model.D, sessnum = 3)
##D plot(fxsurface, covariate = 'D.sum')
##D 
## End(Not run)





