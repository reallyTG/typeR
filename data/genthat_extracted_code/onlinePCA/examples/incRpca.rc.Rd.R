library(onlinePCA)


### Name: incRpca.rc
### Title: Incremental PCA With Reduced Complexity
### Aliases: incRpca.rc

### ** Examples

## Not run: 
##D # Data generation
##D n <- 400 # number of units
##D d <- 10000 # number of variables
##D n0 <- 200 # initial sample
##D q <- 20 # required number of PCs
##D x <- matrix(rnorm(n*d,sd=1/sqrt(d)),n,d) # data matrix
##D x <- t(apply(x,1,cumsum)) # standard Brownian motion
##D 
##D # Initial PCA
##D # Initial PCA
##D xbar0 <- colMeans(x[1:n0,])
##D pca0 <- batchpca(x0c, q, center=xbar0, byrow=TRUE)
##D 
##D # Incremental PCA with rotation
##D xbar <- xbar0
##D pca1 <- pca0
##D system.time({
##D for (i in n0:(n-1)) {
##D 	xbar <- updateMean(xbar, x[i+1,], i)
##D 	pca1 <- incRpca(pca1$values, pca1$vectors, x[i+1,], i, center=xbar)
##D 	}
##D })
##D 
##D # Incremental PCA without rotation
##D xbar <- xbar0
##D pca2 <- list(values=pca0$values, Ut=pca0$vectors, Us=diag(q))
##D 
##D system.time({
##D for (i in n0:(n-1)) {
##D 	xbar <- updateMean(xbar, x[i+1,], i)
##D 	pca2 <- incRpca.rc(pca2$values, pca2$Ut, pca2$Us, x[i+1,], 
##D 		i, center = xbar)
##D 	# Rotate the PC basis and reduce its size to q every k observations
##D 	if (i %% q == 0 || i == n-1) 
##D 		{ pca2$values <- pca2$values[1:q]
##D 		  pca2$Ut <- pca2$Ut %*% pca2$Us[,1:q]
##D 		  pca2$Us <- diag(q)
##D 	}
##D }
##D })
##D 
##D # Check that the results are identical
##D # Relative differences in eigenvalues
##D range(pca1$values/pca2$values-1)
##D # Cosines of angles between eigenvectors 
##D abs(colSums(pca1$vectors * pca2$Ut))
## End(Not run)



