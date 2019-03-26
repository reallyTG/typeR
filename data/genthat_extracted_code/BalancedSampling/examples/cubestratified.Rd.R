library(BalancedSampling)


### Name: cubestratified
### Title: Stratified balanced sampling with pooling of landing phases
### Aliases: cubestratified

### ** Examples

## Not run: 
##D # Example 1
##D N = 10;
##D n = 5;
##D p = rep(n/N,N);
##D strata = c(1,1,2,2,3,3,4,4,5,5);
##D indicators = cubestratified(p,cbind(p),strata);
##D s = (1:N)[indicators==1];
## End(Not run)



