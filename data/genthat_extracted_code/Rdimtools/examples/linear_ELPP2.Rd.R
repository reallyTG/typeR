library(Rdimtools)


### Name: do.elpp2
### Title: Enhanced Locality Preserving Projection (2013)
### Aliases: do.elpp2

### ** Examples

## Not run: 
##D ## generate swiss roll data
##D X = aux.gensamples(n=200)
##D 
##D ## compare with PCA and PFLPP
##D out1 = do.pca(X, ndim=2)
##D out2 = do.pflpp(X, ndim=2)
##D out3 = do.elpp2(X, ndim=2)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="PCA")
##D plot(out2$Y[,1], out2$Y[,2], main="Parameter-Free LPP")
##D plot(out3$Y[,1], out3$Y[,2], main="Enhanced LPP (2013)")
## End(Not run)




