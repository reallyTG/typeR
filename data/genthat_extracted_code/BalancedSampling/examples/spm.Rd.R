library(BalancedSampling)


### Name: spm
### Title: Sequential pivotal method (also known as ordered pivotal
###   sampling and Deville's systematic sampling)
### Aliases: spm

### ** Examples

## Not run: 
##D # Example 1
##D set.seed(12345);
##D N = 100; # population size
##D n = 10; # sample size
##D p = rep(n/N,N); # inclusion probabilities
##D s = spm(p); # select sample 
##D 
##D # Example 2
##D # check inclusion probabilities
##D set.seed(12345);
##D p = c(0.2, 0.25, 0.35, 0.4, 0.5, 0.5, 0.55, 0.65, 0.7, 0.9); # prescribed inclusion probabilities
##D N = length(p); # population size
##D ep = rep(0,N); # empirical inclusion probabilities
##D nrs = 10000; # repetitions
##D for(i in 1:nrs){
##D   s = spm(p);
##D   ep[s]=ep[s]+1;
##D }
##D print(ep/nrs);
## End(Not run)



