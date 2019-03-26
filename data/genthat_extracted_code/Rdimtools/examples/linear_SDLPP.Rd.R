library(Rdimtools)


### Name: do.sdlpp
### Title: Sample-Dependent Locality Preserving Projection
### Aliases: do.sdlpp

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(n=200,dname="crown")
##D 
##D ## compare with PCA
##D out1 <- do.pca(X,ndim=2)
##D out2 <- do.sdlpp(X, t=0.1)
##D out3 <- do.sdlpp(X, t=1)
##D out4 <- do.sdlpp(X, t=10.0)
##D 
##D ## visualize
##D par(mfrow=c(2,2))
##D plot(out1$Y[,1], out1$Y[,2], main="PCA")
##D plot(out2$Y[,1], out2$Y[,2], main="SDLPP; t=0.1")
##D plot(out3$Y[,1], out3$Y[,2], main="SDLPP; t=1")
##D plot(out4$Y[,1], out4$Y[,2], main="SDLPP; t=10")
## End(Not run)





