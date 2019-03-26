library(resemble)


### Name: corDiss
### Title: Correlation and moving correlation dissimilarity measurements
###   (corDiss)
### Aliases: corDiss

### ** Examples

## Not run: 
##D require(prospectr)
##D data(NIRsoil)
##D 
##D Xu <- NIRsoil$spc[!as.logical(NIRsoil$train),]
##D Xr <- NIRsoil$spc[as.logical(NIRsoil$train),]
##D 
##D corDiss(Xr = Xr)
##D 
##D corDiss(Xr = Xr, X2 = Xu)
##D 
##D corDiss(Xr = Xr, ws = 41)
##D 
##D corDiss(Xr = Xr, X2 = Xu, ws = 41) 
## End(Not run)



