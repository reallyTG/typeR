library(resemble)


### Name: plot.orthoProjection
### Title: Plot method for an object of class 'orthoProjection'
### Aliases: plot.orthoProjection

### ** Examples

## Not run: 
##D require(prospectr)
##D 
##D data(NIRsoil)
##D 
##D Xu <- NIRsoil$spc[!as.logical(NIRsoil$train),]
##D Yu <- NIRsoil$CEC[!as.logical(NIRsoil$train)]
##D Yr <- NIRsoil$CEC[as.logical(NIRsoil$train)]
##D Xr <- NIRsoil$spc[as.logical(NIRsoil$train),]
##D 
##D Xu <- Xu[!is.na(Yu),]
##D Yu <- Yu[!is.na(Yu)]
##D 
##D Xr <- Xr[!is.na(Yr),]
##D Yr <- Yr[!is.na(Yr)] 
##D 
##D # A partial least squares projection using the "opc" method
##D # for the selection of the optimal number of components
##D plsProj <- orthoProjection(Xr = Xr, Yr = Yr, X2 = Xu, 
##D                            method = "pls", 
##D                            pcSelection = list("opc", 40))
##D 
##D plot(plsProj)
## End(Not run)



