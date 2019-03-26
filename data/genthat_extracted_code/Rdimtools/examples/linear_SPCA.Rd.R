library(Rdimtools)


### Name: do.spca
### Title: Sparse Principal Component Analysis
### Aliases: do.spca

### ** Examples

## Not run: 
##D ## generate default dataset and make its dimension three-folds.
##D Xp <- aux.gensamples()
##D X  <- cbind(Xp,Xp,Xp)
##D 
##D ## try different regularization parameters for sparsity
##D out1 <- do.spca(X,ndim=2,rho=0.01)
##D out2 <- do.spca(X,ndim=2,rho=1)
##D out3 <- do.spca(X,ndim=2,rho=100)
##D 
##D ## Visualize principal components as columns in an image
##D par(mfrow=c(1,3))
##D image(t(out1$projection), main="SPCA::rho=0.01")
##D image(t(out2$projection), main="SPCA::rho=1")
##D image(t(out3$projection), main="SPCA::rho=100")
## End(Not run)




