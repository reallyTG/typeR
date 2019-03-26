library(BalancedSampling)


### Name: sb
### Title: Spatial balance
### Aliases: sb

### ** Examples

## Not run: 
##D # check spatial balance
##D set.seed(1234567);
##D N = 500;
##D n = 70;
##D p = rep(n/N,N);
##D X = cbind(runif(N),runif(N));
##D 
##D # select lpm1 sample
##D s = lpm1(p,X);
##D # calculate balance
##D B = sb(p,X,s);
##D 
## End(Not run)



