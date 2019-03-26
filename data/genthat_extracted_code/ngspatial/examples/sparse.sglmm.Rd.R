library(ngspatial)


### Name: sparse.sglmm
### Title: Fit a sparse SGLMM.
### Aliases: sparse.sglmm

### ** Examples

## Not run: 
##D 
##D The following code duplicates the analysis described in (Hughes and Haran, 2013). The data are
##D infant mortality data for 3,071 US counties. We do a spatial Poisson regression with offset.
##D 
##D data(infant)
##D infant$low_weight = infant$low_weight / infant$births
##D attach(infant)
##D Z = deaths
##D X = cbind(1, low_weight, black, hispanic, gini, affluence, stability)
##D data(A)
##D set.seed(123456)
##D fit = sparse.sglmm(Z ~ X - 1 + offset(log(births)), family = poisson, A = A, method = "RSR",
##D                    tune = list(sigma.s = 0.02), verbose = TRUE)
##D summary(fit)
## End(Not run) 



