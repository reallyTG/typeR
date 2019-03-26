library(mhtboot)


### Name: qelbow
### Title: Finding corner of a quantile of ordered transformed p values
### Aliases: qelbow

### ** Examples

    
## Not run: 
##D     
##D n = 50;m = 250;m0 = 20;
##D sigeff = 1;
##D Sigma <- 0.25*diag(m)
##D X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
##D porder <- pboot.1sample(X=X,B=100,ncpus = 1)
##D out <- qelbow(porder = porder)
##D out
## End(Not run)



