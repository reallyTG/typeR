library(resemble)


### Name: neigCleaning
### Title: A function for identifying samples that do not belong to any of
###   the neighbourhoods of a given set of samples (neigCleaning)
### Aliases: neigCleaning

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
##D # Identify the non-neighbour samples using the default parameters
##D # (In this example all the samples in Xr belong at least to the 
##D # first 100 neighbours of one sample in Xu)
##D ex1 <- neigCleaning(Xr = Xr, Xu = Xu, 
##D                             k.thr = 100)
##D 
##D # Identify the non-neighbour samples using principal component(PC) 
##D # and partial least squares (PLS) distances, and using the "opc" 
##D # approach for selecting the number of components
##D ex2 <- neigCleaning(Xr = Xr, Xu = Xu, 
##D                             Yr = Yr,
##D                             sm = "pc",
##D                             pcSelection = list("opc", 40),
##D                             k.thr = 150)
##D 
##D ex3 <- neigCleaning(Xr = Xr, Xu = Xu, 
##D                             Yr = Yr,
##D                             sm = "pls",
##D                             pcSelection = list("opc", 40),
##D                             k.thr = 150)
##D 
##D # Identify the non-neighbour samples using distances computed 
##D # based on local PC analysis and using the "cumvar" and "var" 
##D # approaches for selecting the number of PCs
##D ex4 <- neigCleaning(Xr = Xr, Xu = Xu, 
##D                             sm = "loc.pc",
##D                             pcSelection = list("cumvar", 0.999),
##D                             k0 = 200,
##D                             k.thr = 150)
##D 
##D ex5 <- neigCleaning(Xr = Xr, Xu = Xu, 
##D                             sm = "loc.pc",
##D                             pcSelection = list("var", 0.001),
##D                             k0 = 200,
##D                             k.thr = 150)
## End(Not run)                          



