library(etasFLP)


### Name: profile.etasclass
### Title: profile method for etasclass objects (ETAS model)
### Aliases: profile.etasclass
### Keywords: ETAS earthquake profile likelihood

### ** Examples

## Not run: 
##D ##
##D data("italycatalog")
##D # load a sample catalog of italian seismicity  
##D 
##D etas.flp=etasclass(italycatalog,  
##D magn.threshold = 3.0,  magn.threshold.back = 3.5,
##D k0 = 0.005, c = 0.005, p = 1.01, a = 1.05, gamma = 0.6, q = 1.52, d = 1.1,
##D params.ind = c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
##D declustering = TRUE, thinning = FALSE, flp = TRUE, ndeclust = 15,
##D onlytime = FALSE, is.backconstant = FALSE,
##D description = "etas flp",sectoday = TRUE, usenlm = TRUE, epsmax = 0.001)
##D 
##D 
##D # profile likelihood for the 5-th parameter (a), with plot:
##D 
##D prof.flp = profile(etas.flp, nprofile = 7, iprofile = 5)
##D plot(prof.flp)
##D Asymptotic  confidence  intervals: 
##D   Coverage Lower Upper
##D 1     0.90 1.393 1.624
##D 2     0.95 1.381 1.635
##D 3     0.99 1.346 1.659
##D 
##D 
## End(Not run)


