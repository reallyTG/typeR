library(BalancedSampling)


### Name: lcubestratified
### Title: Stratified doubly balanced sampling with pooling of landing
###   phases
### Aliases: lcubestratified

### ** Examples

## Not run: 
##D # Example 1
##D N = 10;
##D n = 5;
##D p = rep(n/N,N);
##D Xspread = cbind(1:N);
##D strata = c(1,1,1,1,1,1,2,2,2,2);
##D indicators = lcubestratified(p,Xspread,cbind(p),strata);
##D s = (1:N)[indicators==1];
## End(Not run)



