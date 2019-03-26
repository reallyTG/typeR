library(etasFLP)


### Name: summary.etasclass
### Title: Summary method for etasclass objects
### Aliases: summary.etasclass
### Keywords: ETAS earthquake summary

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
##D # summary method for the etasclass object
##D 
##D summary(etas.flp)
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
##D Execution started:                  2015-06-02 13:01:04 
##D Elapsed time of execution (hours)   0.2473813 
##D Number of observations             2158 
##D Magnitude threshold                3 
##D declustering                        TRUE 
##D Number of declustering iterations   4 
##D Kind of declustering                weighting 
##D flp                                 TRUE 
##D sequence of AIC values for each iteration 
##D 49620.08 48458.86 48418.2 48415.17 
##D  
##D ------------------------------------------------------- 
##D  
##D ETAS Parameters: 
##D             Estimates       std.err.
##D mu           0.355850       0.011294
##D k0           0.008373       0.002053
##D c            0.009404       0.001795
##D p            1.121630       0.016271
##D a            1.509371       0.064077
##D gamma        0.857945       0.084688
##D d            1.915139       0.306384
##D q            1.836391       0.067067
##D ------------------------------------------------------- 
##D 
## End(Not run)



