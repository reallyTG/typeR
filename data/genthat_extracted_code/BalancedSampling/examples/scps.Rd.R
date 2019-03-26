library(BalancedSampling)


### Name: scps
### Title: Spatially correlated Poisson sampling
### Aliases: scps

### ** Examples

## Not run: 
##D # Example 1
##D set.seed(12345);
##D N = 1000; # population size
##D n = 100; # sample size
##D p = rep(n/N,N); # inclusion probabilities
##D X = cbind(runif(N),runif(N)); # matrix of auxiliary variables
##D s = scps(p,X); # select sample 
##D plot(X[,1],X[,2]); # plot population
##D points(X[s,1],X[s,2], pch=19); # plot sample
##D 
##D # Example 2
##D # check inclusion probabilities
##D set.seed(12345);
##D p = c(0.2, 0.25, 0.35, 0.4, 0.5, 0.5, 0.55, 0.65, 0.7, 0.9); # prescribed inclusion probabilities
##D N = length(p); # population size
##D X = cbind(runif(N),runif(N)); # some artificial auxiliary variables
##D ep = rep(0,N); # empirical inclusion probabilities
##D nrs = 10000; # repetitions
##D for(i in 1:nrs){
##D   s = scps(p,X);
##D   ep[s]=ep[s]+1;
##D }
##D print(ep/nrs);
## End(Not run)



