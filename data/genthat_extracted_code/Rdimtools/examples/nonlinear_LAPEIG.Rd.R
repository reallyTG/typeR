library(Rdimtools)


### Name: do.lapeig
### Title: Laplacian Eigenmaps
### Aliases: do.lapeig

### ** Examples

## Not run: 
##D ## generate swiss-roll dataset of size 100
##D X <- aux.gensamples(n=100)
##D 
##D ## two types of graph laplacians using 20% of neighbors
##D out1 <- do.lapeig(X,ndim=2,type=c("proportion",0.05),kernelscale=10) # weighted version
##D out2 <- do.lapeig(X,ndim=2,type=c("proportion",0.05),weighted=FALSE) # combinatorial
##D 
##D ## Visualize
##D par(mfrow=c(1,2))
##D plot(out1$Y[,1],out1$Y[,2],main="weighted")
##D plot(out2$Y[,1],out2$Y[,2],main="combinatorial")
## End(Not run)




