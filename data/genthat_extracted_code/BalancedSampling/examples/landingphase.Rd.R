library(BalancedSampling)


### Name: landingphase
### Title: Landing phase of the cube method
### Aliases: landingphase

### ** Examples

## Not run: 
##D # Example 1
##D # Select sample
##D set.seed(12345);
##D N = 100; # population size
##D n = 10; # sample size
##D p = rep(n/N,N); # inclusion probabilities
##D X = cbind(p,runif(N),runif(N)); # matrix of auxiliary variables
##D pflight = flightphase(p,X); # flight
##D indicators = landingphase(p,pflight,X); # landing
##D # final sample
##D s = (1:N)[indicators==1];
## End(Not run)



