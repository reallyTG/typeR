library(sirt)


### Name: greenyang.reliability
### Title: Reliability for Dichotomous Item Response Data Using the Method
###   of Green and Yang (2009)
### Aliases: greenyang.reliability
### Keywords: Reliability

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Reliability estimation of Reading dataset data.read
##D #############################################################################
##D miceadds::library_install("psych")
##D set.seed(789)
##D data( data.read )
##D dat <- data.read
##D 
##D # calculate matrix of tetrachoric correlations
##D dat.tetra <- psych::tetrachoric(dat)      # using tetrachoric from psych package
##D dat.tetra2 <- sirt::tetrachoric2(dat)       # using tetrachoric2 from sirt package
##D 
##D # perform parallel factor analysis
##D fap <- psych::fa.parallel.poly(dat, n.iter=1 )
##D   ##   Parallel analysis suggests that the number of factors=3
##D   ##   and the number of components=2
##D 
##D # parallel factor analysis based on tetrachoric correlation matrix
##D ##       (tetrachoric2)
##D fap2 <- psych::fa.parallel(dat.tetra2$rho, n.obs=nrow(dat),  n.iter=1 )
##D   ## Parallel analysis suggests that the number of factors=6
##D   ## and the number of components=2
##D   ## Note that in this analysis, uncertainty with respect to thresholds is ignored.
##D 
##D # calculate reliability using a model with 4 factors
##D greenyang.reliability( object.tetra=dat.tetra, nfactors=4 )
##D   ##                                            coefficient dimensions estimate
##D   ## Omega Total (1D)                               omega_1          1    0.771
##D   ## Omega Total (4D)                               omega_t          4    0.844
##D   ## Omega Hierarchical (4D)                        omega_h          4    0.360
##D   ## Omega Hierarchical Asymptotic (4D)            omega_ha          4    0.427
##D   ## Explained Common Variance (4D)                     ECV          4    0.489
##D   ## Explained Variance (First Eigenvalue)          ExplVar         NA   35.145
##D   ## Eigenvalue Ratio (1st to 2nd Eigenvalue) EigenvalRatio         NA    2.121
##D 
##D # calculation of Green-Yang-Reliability based on tetrachoric correlations
##D #   obtained by tetrachoric2
##D greenyang.reliability( object.tetra=dat.tetra2, nfactors=4 )
##D 
##D # The same result will be obtained by using fap as the input
##D greenyang.reliability( object.tetra=fap, nfactors=4 ) 
## End(Not run)



