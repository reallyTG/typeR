library(Rdimtools)


### Name: do.idmap
### Title: Interactive Document Map
### Aliases: do.idmap

### ** Examples

## Not run: 
##D ## load iris data
##D data(iris)
##D X <- as.matrix(iris[,1:4])
##D 
##D ## let's compare with other methods
##D out1 <- do.pca(X, ndim=2)
##D out2 <- do.sne(X, ndim=2)
##D out3 <- do.idmap(X, ndim=2, engine="NNP")
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="PCA")
##D plot(out2$Y[,1], out2$Y[,2], main="SNE")
##D plot(out3$Y[,1], out3$Y[,2], main="IDMAP")
## End(Not run)




