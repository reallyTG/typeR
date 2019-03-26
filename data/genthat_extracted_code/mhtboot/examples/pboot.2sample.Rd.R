library(mhtboot)


### Name: pboot.2sample
### Title: Generate bootstrap distribution of p values based on user given
###   two sample tests.
### Aliases: pboot.2sample

### ** Examples

## Not run: 
##D n = 50;m = 250;m0 = 20;
##D sigeff = 1;
##D Sigma <- 0.25*diag(m)
##D X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
##D porder <- pboot.1sample(X=X,B=100,ncpus = 1)
##D plotpboot(porder) 
## End(Not run)



