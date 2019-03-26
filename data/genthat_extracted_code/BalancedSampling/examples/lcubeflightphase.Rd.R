library(BalancedSampling)


### Name: lcubeflightphase
### Title: Flight phase for the local cube method
### Aliases: lcubeflightphase

### ** Examples

## Not run: 
##D # Example 1
##D # Select sample
##D set.seed(12345);
##D N = 100; # population size
##D n = 10; # sample size
##D p = rep(n/N,N); # inclusion probabilities
##D X = cbind(runif(N),runif(N)); # matrix of auxiliary variables
##D pflight = lcubeflightphase(p,X,cbind(p,X)); 
##D # check balance
##D colSums(X)
##D colSums(X/p*pflight)
##D 
## End(Not run)



