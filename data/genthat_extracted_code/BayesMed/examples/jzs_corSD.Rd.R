library(BayesMed)


### Name: jzs_corSD
### Title: A default Bayesian hypothesis test for correlation using the
###   Savage-Dickey method.
### Aliases: jzs_corSD

### ** Examples

## Not run: 
##D # generate correlational data
##D X <- rnorm(100)
##D Y <- .4*X + rnorm(100,0,1)
##D 
##D # run jzs_cor
##D result <- jzs_corSD(X,Y)
##D 
##D # inspect posterior distribution 
##D plot(result$alpha_samples)
##D 
##D # print a traceplot of the chains
##D plot(result$jagssamples)
##D 
## End(Not run)



