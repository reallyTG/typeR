library(Rdimtools)


### Name: do.lamp
### Title: Local Affine Multidimensional Projection
### Aliases: do.lamp

### ** Examples

## Not run: 
##D ## load iris data
##D data(iris)
##D X <- as.matrix(iris[,1:4])
##D 
##D ## let's compare with PCA
##D out1 <- do.pca(X, ndim=2)      # PCA
##D out2 <- do.lamp(X, ndim=2)     # LAMP
##D 
##D ## visualize
##D par(mfrow=c(1,2))
##D plot(out1$Y[,1], out1$Y[,2], main="PCA")
##D plot(out2$Y[,1], out2$Y[,2], main="LAMP")
## End(Not run)




