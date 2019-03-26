library(BalancedSampling)


### Name: lcubelandingphase
### Title: Landing phase for the local cube method
### Aliases: lcubelandingphase

### ** Examples

## Not run: 
##D # Example 1
##D # Select sample
##D set.seed(12345);
##D N = 100; # population size
##D n = 10; # sample size
##D p = rep(n/N,N); # inclusion probabilities
##D X = cbind(runif(N),runif(N)); # matrix of auxiliary variables
##D pflight = lcubeflightphase(p,X,cbind(p,X)); # flight
##D indicators = lcubelandingphase(p,pflight,X,cbind(p,X)); # landing
##D # final sample
##D s = (1:N)[indicators==1];
## End(Not run)



