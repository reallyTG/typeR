library(BalancedSampling)


### Name: hlpm
### Title: Hierarchical local pivotal method
### Aliases: hlpm

### ** Examples

## Not run: 
##D ############
##D ## Example with two subsamples
##D ############
##D 
##D N = 100; # population size
##D X = cbind(runif(N),runif(N)); # auxiliary variables
##D n = 10; # size of initial sample
##D p = rep(n/N,N); # inclusion probabilities of initial sample
##D sizes = c(7,3); # sizes of the two subsamples
##D hlpm(p,X,sizes) # selection of samples using hierarchical local pivotal method
##D 
## End(Not run)



