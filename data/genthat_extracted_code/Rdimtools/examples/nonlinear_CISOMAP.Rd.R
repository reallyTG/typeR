library(Rdimtools)


### Name: do.cisomap
### Title: Conformal Isometric Feature Mapping
### Aliases: do.cisomap

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(dname="cswiss",n=500)
##D 
##D ## 1. original Isomap
##D output1 <- do.isomap(X,ndim=2)
##D 
##D ## 2. C-Isomap
##D output2 <- do.cisomap(X,ndim=2)
##D 
##D ## 3. C-Isomap on a binarized graph
##D output3 <- do.cisomap(X,ndim=2,weight=FALSE)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="Isomap")
##D plot(output2$Y[,1],output2$Y[,2],main="C-Isomap")
##D plot(output3$Y[,1],output3$Y[,2],main="Binarized C-Isomap")
## End(Not run)




