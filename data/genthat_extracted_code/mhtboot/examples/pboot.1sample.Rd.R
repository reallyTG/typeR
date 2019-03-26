library(mhtboot)


### Name: pboot.1sample
### Title: Generate Bootstrap Distribution of p values for one sample
###   tests.
### Aliases: pboot.1sample

### ** Examples

## Not run: 
##D n = 50;m = 250;m0 = 20;
##D sigeff = 1;
##D Sigma <- 0.25*diag(m)
##D X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
##D porder <- pboot.1sample(X=X,B=100,ncpus = 1)
##D plotpboot(porder)
## End(Not run)



