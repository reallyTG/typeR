library(Rdimtools)


### Name: do.fastmap
### Title: FastMap
### Aliases: do.fastmap

### ** Examples

## Not run: 
##D ## load iris data
##D data(iris)
##D X <- as.matrix(iris[,1:4])
##D 
##D ## let's compare with other methods
##D out1 <- do.pca(X, ndim=2)      # PCA
##D out2 <- do.mds(X, ndim=2)      # Classical MDS
##D out3 <- do.fastmap(X, ndim=2)  # FastMap
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="PCA")
##D plot(out2$Y[,1], out2$Y[,2], main="MDS")
##D plot(out3$Y[,1], out3$Y[,2], main="FastMap")
## End(Not run)




