library(mhtboot)


### Name: plotpboot
### Title: Quantile plots for p value distributions.
### Aliases: plotpboot

### ** Examples

## Not run: 
##D n = 50;m = 250;m0 = 20;
##D sigeff = 1;
##D Sigma <- 0.25*diag(m)
##D X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
##D Y <- datgen(n,m,m0,sigeff,Sigma = Sigma)
##D porder <- pboot.2sample(X=X,Y = Y, B=100,ncpus = 1)
##D plotpboot(porder)
## End(Not run)



