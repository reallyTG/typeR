library(resemble)


### Name: orthoDiss
### Title: A function for computing dissimilarity matrices from orthogonal
###   projections (orthoDiss)
### Aliases: orthoDiss

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
##D # Computation of the orthogonal dissimilarity matrix using the 
##D # default parameters
##D ex1 <- orthoDiss(Xr = Xr, X2 = Xu)
##D 
##D # Computation of a principal component dissimilarity matrix using 
##D # the "opc" method for the selection of the principal components
##D ex2 <- orthoDiss(Xr = Xr, X2 = Xu, 
##D                  Yr = Yr, 
##D                  pcSelection = list("opc", 40), 
##D                  method = "pca", 
##D                  return.all = TRUE)
##D 
##D # Computation of a partial least squares (PLS) dissimilarity 
##D # matrix using the "opc" method for the selection of the PLS 
##D # components
##D ex3 <- orthoDiss(Xr = Xr, X2 = Xu, 
##D                  Yr = Yr, 
##D                  pcSelection = list("opc", 40), 
##D                  method = "pls")
##D 
##D # Computation of a partial least squares (PLS) local dissimilarity 
##D # matrix using the "opc" method for the selection of the PLS 
##D # components
##D ex4 <- orthoDiss(Xr = Xr, X2 = Xu, 
##D                  Yr = Yr, 
##D                  pcSelection = list("opc", 40), 
##D                  method = "pls",
##D                  local = TRUE,
##D                  k0 = 200)
## End(Not run)



