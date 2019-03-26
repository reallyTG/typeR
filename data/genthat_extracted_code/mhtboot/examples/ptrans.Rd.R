library(mhtboot)


### Name: ptrans
### Title: Transformation of order statistics of the p value distributions
### Aliases: ptrans

### ** Examples

## Not run: 
##D X <- datgen(n=100,m=80,m0=20,sigeff=1,Sigma = 0.25*diag(80))
##D porder <- pboot.1sample(X=X,B=100,ncpus = 1)
##D porder.tr <- ptrans(porder,trans="normal")
##D plotpboot(porder.tr)
## End(Not run)



