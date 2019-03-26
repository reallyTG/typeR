library(prospectr)


### Name: e2m
### Title: A function for transforming a matrix from its Euclidean space to
###   its Mahalanobis space
### Aliases: e2m
### Keywords: internal

### ** Examples

# test data
## Not run: 
##D X <- matrix(rnorm(500),ncol=5)
##D # Normal way to compute the Mahalanobis distance
##D md1 <- sqrt(mahalanobis(X, center = colMeans(X), cov = cov(X)))
##D # Projection approach for computing the Mahalanobis distance
##D #1. Projecting from the Euclidean to the Mahalanobis space
##D Xm <- e2m(X, sm.method = 'svd')
##D #2. Use the normal Euclidean distance on the Mahalanobis space
##D md2 <- sqrt(rowSums((sweep(Xm, 2, colMeans(Xm), '-'))^2))
##D # Plot the results of both methods
##D plot(md1, md2)
##D # Test on a real dataset
##D #Mahalanobis in the spectral space
##D data(NIRsoil)
##D X <- NIRsoil$spc
##D Xm <- e2m(X, sm.method = 'svd')
##D md2 <- sqrt(rowSums((sweep(Xm, 2, colMeans(Xm), '-'))^2))
##D 
##D md1 <- sqrt(mahalanobis(X, center = colMeans(X), cov = cov(X))) # does not work#'
##D #Mahalanobis in the PC space
##D pc <- 20
##D pca <- prcomp(X, center=TRUE,scale=TRUE)
##D X <- pca$x[, 1:pc]
##D X2 <- sweep(pca$x[,1:pc,drop=FALSE],2,pca$sdev[1:pc],'/')
##D md4 <- sqrt(rowSums((sweep(Xm, 2, colMeans(Xm), '-'))^2))
##D md5 <- sqrt(rowSums((sweep(X2, 2, colMeans(X2), '-'))^2))
##D md3 <- sqrt(mahalanobis(X, center = colMeans(X), cov = cov(X))) # does work
## End(Not run)



