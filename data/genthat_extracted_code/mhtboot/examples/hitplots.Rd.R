library(mhtboot)


### Name: hitplots
### Title: Plot area under p value cdf below a cutoff.
### Aliases: hitplots

### ** Examples

## Not run: 
##D n = 50;m = 250;m0 = 20;
##D sigeff = 1;
##D Sigma <- 0.25*diag(m)
##D X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
##D porder <- pboot.1sample(X, B = 100, ncpus = 1)
##D hitplots(porder)
## End(Not run)



