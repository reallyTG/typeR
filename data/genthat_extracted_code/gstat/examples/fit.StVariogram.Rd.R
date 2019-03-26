library(gstat)


### Name: fit.StVariogram
### Title: Fit a spatio-temporal sample variogram to a sample variogram
### Aliases: fit.StVariogram
### Keywords: models

### ** Examples

# separable model: spatial and temporal sill will be ignored
# and kept constant at 1-nugget respectively. A joint sill is used.
## Not run: 
##D separableModel <- vgmST("separable", 
##D                         method = "Nelder-Mead", # no lower & upper needed
##D                         space=vgm(0.9,"Exp", 123, 0.1),
##D                         time =vgm(0.9,"Exp", 2.9, 0.1),
##D                         sill=100)
##D 
##D data(vv)
##D separableModel <- fit.StVariogram(vv, separableModel,
##D                                   method="L-BFGS-B",
##D                                   lower=c(10,0,0.01,0,1),
##D                                   upper=c(500,1,20,1,200))
##D plot(vv, separableModel)
## End(Not run) # dontrun



