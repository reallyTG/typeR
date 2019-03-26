library(Rdimtools)


### Name: do.nnp
### Title: Nearest Neighbor Projection
### Aliases: do.nnp

### ** Examples

## Not run: 
##D ## load iris data
##D data(iris)
##D X <- as.matrix(iris[,1:4])
##D 
##D ## let's compare with other methods
##D out1 <- do.nnp(X, ndim=2)      # NNP
##D out2 <- do.pca(X, ndim=2)      # PCA
##D out3 <- do.lamp(X, ndim=2)     # LAMP
##D 
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="NNP")
##D plot(out2$Y[,1], out2$Y[,2], main="PCA")
##D plot(out3$Y[,1], out3$Y[,2], main="LAMP")
## End(Not run)



