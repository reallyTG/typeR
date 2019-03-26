library(Rdimtools)


### Name: do.pca
### Title: Principal Component Analysis
### Aliases: do.pca

### ** Examples

## Not run: 
##D ## generate data with clear difference
##D X1 <- matrix(rnorm(100),nrow=10)-15
##D X2 <- matrix(rnorm(100),nrow=10)
##D X3 <- matrix(rnorm(100),nrow=10)+15
##D X  <- rbind(X1,X2,X3)
##D 
##D ## try different preprocessing procedure
##D out1 <- do.pca(X, ndim=2, preprocess="center")
##D out2 <- do.pca(X, ndim=2, preprocess="decorrelate")
##D out3 <- do.pca(X, ndim=2, preprocess="whiten")
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="PCA::'center'")
##D plot(out2$Y[,1], out2$Y[,2], main="PCA::'decorrelate'")
##D plot(out3$Y[,1], out3$Y[,2], main="PCA::'whiten'")
## End(Not run)




