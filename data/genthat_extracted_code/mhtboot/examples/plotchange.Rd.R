library(mhtboot)


### Name: plotchange
### Title: plotchange
### Aliases: plotchange

### ** Examples

  
## Not run: 
##D       
##D n = 50;m = 250;m0 = 20;
##D sigeff = 1;
##D Sigma <- 0.25*diag(m)
##D X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
##D porder <- pboot.1sample(X=X,B=100,ncpus = 1)
##D plotchange(porder[1,])
## End(Not run)



