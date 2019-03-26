library(mhtboot)


### Name: pboot.1sample.s
### Title: Generate p value distributions and estimate of sample
###   correlation matrix using bootstrap.
### Aliases: pboot.1sample.s

### ** Examples

## Not run: 
##D n = 50;m = 250;m0 = 20;
##D sigeff = 1;
##D Sigma <- 0.25*diag(m)
##D X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
##D porder <- pboot.1sample.s(X=X,B=100,sout = TRUE,ncpus = 1)
##D plotpboot(porder)
## End(Not run) 



