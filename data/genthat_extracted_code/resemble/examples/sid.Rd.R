library(resemble)


### Name: sid
### Title: A function for computing the spectral information divergence
###   between spectra (sid)
### Aliases: sid

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
##D Xr <- Xr[!is.na(Yr),]
##D 
##D # Example 1
##D # Compute the SID distance between all the samples in Xr
##D xr.sid <- sid(Xr = Xr)
##D xr.sid
##D 
##D # Example 2
##D # Compute the SID distance between the samples in Xr and the samples 
##D # in Xu
##D xru.sid <- sid(Xr = Xr, X2 = Xu)
##D xru.sid
##D 
##D # Example 3
##D # Compute the SID distance between the samples in Xr and the samples 
##D # in Xu using the histograms
##D xru.sid.hist <- sid(Xr = Xr, X2 = Xu, mode = "feature")
##D xru.sid.hist
## End(Not run)



