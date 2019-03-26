library(Rdimtools)


### Name: do.spp
### Title: Sparsity Preserving Projection
### Aliases: do.spp

### ** Examples

## Not run: 
##D ## generate samples
##D X <- aux.gensamples(n=200, dname="crown")
##D 
##D ## test different tolerance levels
##D out1 <- do.spp(X,ndim=2,reltol=0.001)
##D out2 <- do.spp(X,ndim=2,reltol=0.01)
##D out3 <- do.spp(X,ndim=2,reltol=0.1)
##D 
##D # visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="reltol = 0.001")
##D plot(out2$Y[,1], out2$Y[,2], main="reltol = 0.01")
##D plot(out3$Y[,1], out3$Y[,2], main="reltol = 0.1")
## End(Not run)



