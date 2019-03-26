library(BayesMed)


### Name: jzs_partcor
### Title: A default Bayesian hypothesis test for partial correlation
###   (Wetzels, R., & Wagenmakers).
### Aliases: jzs_partcor

### ** Examples

## Not run: 
##D # simulate partially correlated data
##D X <- rnorm(50,0,1)
##D C <- .5*X + rnorm(50,0,1)
##D Y <- .3*X + .6*C + rnorm(50,0,1)
##D 
##D # run jzs_partcor
##D res <- jzs_partcor(X,Y,C)
##D 
##D # plot posterior samples
##D plot(res$beta_samples)
##D 
##D # plot traceplot
##D plot(res$jagssamples)
##D # where the first chain (theta[1]) is for tau' and the second chain (theta[2]) for beta
##D 
## End(Not run)



