library(BalancedSampling)


### Name: cube
### Title: Cube method (Balanced sampling)
### Aliases: cube

### ** Examples

## Not run: 
##D # Example 1
##D # Select sample
##D set.seed(12345);
##D N = 1000; # population size
##D n = 100; # sample size
##D p = rep(n/N,N); # inclusion probabilities
##D X = cbind(p,runif(N),runif(N)); # matrix of auxiliary variables
##D s = cube(p,X); # select sample 
##D 
##D 
##D # Example 2
##D # Check inclusion probabilities
##D set.seed(12345);
##D p = c(0.2, 0.25, 0.35, 0.4, 0.5, 0.5, 0.55, 0.65, 0.7, 0.9); # prescribed inclusion probabilities
##D N = length(p); # population size
##D ep = rep(0,N); # empirical inclusion probabilities
##D nrs = 10000; # repetitions
##D for(i in 1:nrs){
##D   s = cube(p,cbind(p));
##D   ep[s]=ep[s]+1;
##D }
##D print(ep/nrs);
##D 
##D # Example 3
##D # How fast is it?
##D # Let's check with N = 100 000 and 5 balancing variables
##D set.seed(12345);
##D N = 100000; # population size
##D n = 100; # sample size
##D p = rep(n/N,N); # inclusion probabilities
##D # matrix of 5 auxiliary variables
##D X = cbind(p,runif(N),runif(N),runif(N),runif(N)); 
##D system.time(cube(p,X));  
## End(Not run)



