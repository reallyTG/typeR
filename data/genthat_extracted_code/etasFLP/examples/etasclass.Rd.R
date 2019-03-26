library(etasFLP)


### Name: etasclass
### Title: Mixed estimation of an ETAS model
### Aliases: etasclass
### Keywords: ETAS earthquake kernel flp

### ** Examples

## Not run: 
##D data("italycatalog")
##D # load a sample catalog of the italian seismicity
##D 
##D 
##D etas.flp=etasclass(italycatalog,  
##D magn.threshold = 3.0,  magn.threshold.back = 3.5,
##D k0 = 0.005, c = 0.005, p = 1.01, a = 1.05, gamma = 0.6, q = 1.52, d = 1.1,
##D params.ind = c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
##D declustering = TRUE, thinning = FALSE, flp = TRUE, ndeclust = 15,
##D onlytime = FALSE, is.backconstant = FALSE,
##D description = "etas flp",sectoday = TRUE, usenlm = TRUE, epsmax = 0.001)
##D # execution of etasclass for events with minimum magnitude of 3.0. 
##D # The events with magnitude at least 3.5 are used to build a first approximation
##D # for the background intensity function
##D # (magn.threshold.back=3.5)
##D 
##D # print method for the etasclass object
##D etas.flp
##D Call: 
##D  
##D etasclass(cat.orig = italycatalog, magn.threshold = 3, magn.threshold.back = 3.5, 
##D     k0 = 0.005, c = 0.005, p = 1.01, a = 1.05, gamma = 0.6, d = 1.1, 
##D     q = 1.52, params.ind = c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 
##D         TRUE, TRUE), declustering = TRUE, thinning = FALSE, flp = TRUE, 
##D     ndeclust = 15, onlytime = FALSE, is.backconstant = FALSE, 
##D     description = "etas flp", sectoday = TRUE, usenlm = TRUE, 
##D     epsmax = 0.001)
##D 
##D  
##D  
##D etas flp 
##D Number of observations             2158 
##D ETAS Parameters: 
##D       mu       k0        c        p        a    gamma        d        q 
##D 0.355850 0.008373 0.009404 1.121630 1.509371 0.857945 1.915139 1.836391 
##D    
##D 
##D # plot results with maps of intensities and diagnostic tools 
##D 
##D plot(etas.flp)
##D 
## End(Not run)



