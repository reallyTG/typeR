library(Rdimtools)


### Name: do.rpca
### Title: Robust Principal Component Analysis
### Aliases: do.rpca

### ** Examples

## Not run: 
##D ## Load Iris data and put some noise
##D data(iris)
##D noise = 0.2
##D X = as.matrix(iris[,1:4])
##D X = X + matrix(noise*rnorm(length(X)), nrow=nrow(X))
##D 
##D ## try different regularization parameters
##D rpca1 = do.rpca(X, lambda=0.1)
##D rpca2 = do.rpca(X, lambda=1)
##D rpca3 = do.rpca(X, lambda=10)
##D 
##D ## apply identical PCA methods
##D out1 = do.pca(rpca1$L, ndim=2)
##D out2 = do.pca(rpca2$L, ndim=2)
##D out3 = do.pca(rpca3$L, ndim=2)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="RPCA+PCA::lambda=0.1")
##D plot(out2$Y[,1], out2$Y[,2], main="RPCA+PCA::lambda=1")
##D plot(out3$Y[,1], out3$Y[,2], main="RPCA+PCA::lambda=10")
## End(Not run)




