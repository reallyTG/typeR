library(BalancedSampling)


### Name: flightphase
### Title: Flight phase of the cube method
### Aliases: flightphase

### ** Examples

## Not run: 
##D # Example 1
##D # Select sample and check balance
##D set.seed(12345);
##D N = 100; # population size
##D n = 10; # sample size
##D p = rep(n/N,N); # inclusion probabilities
##D X = cbind(p,runif(N),runif(N)); # matrix of auxiliary variables
##D 
##D pflight = flightphase(p,X);
##D 
##D # check balance after flight
##D colSums(X)
##D colSums(X/p*pflight)
##D 
##D # select final sample as indicators
##D indicators = landingphase(p,pflight,X);
##D 
##D # check final balance
##D colSums(X)
##D colSums(X/p*indicators)
##D 
##D # final sample as indexes
##D s = (1:N)[indicators==1];
## End(Not run)



