library(resemble)


### Name: orthoProjection
### Title: Orthogonal projections using partial least squares and principal
###   component analysis
### Aliases: orthoProjection pcProjection plsProjection
###   predict.orthoProjection

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
##D # A principal components projection using the "opc" method
##D # for the selection of the optimal number of components
##D pcProj <- orthoProjection(Xr = Xr, Yr = Yr, X2 = Xu, 
##D                           method = "pca", 
##D                           pcSelection = list("opc", 40))
##D                            
##D # A partial least squares projection using the "cumvar" method
##D # for the selection of the optimal number of components
##D plsProj2 <- orthoProjection(Xr = Xr, Yr = Yr, X2 = Xu, 
##D                             method = "pls", 
##D                             pcSelection = list("cumvar", 0.99))
## End(Not run) 



