library(onlinePCA)


### Name: perturbationRpca
### Title: Recursive PCA using a rank 1 perturbation method
### Aliases: perturbationRpca

### ** Examples

n <- 1e3
n0 <- 5e2
d <- 10
x <- matrix(runif(n*d), n, d)
 x <- x %*% diag(sqrt(12*(1:d)))
# The eigenvalues of cov(x) are approximately equal to 1, 2, ..., d
# and the corresponding eigenvectors are approximately equal to 
# the canonical basis of R^d

## Perturbation-based recursive PCA
# Initialization: use factor 1/n0 (princomp) rather 
# than factor 1/(n0-1) (prcomp) in calculations
pca <- princomp(x[1:n0,], center=FALSE)
xbar <- pca$center
pca <- list(values=pca$sdev^2, vectors=pca$loadings) 

for (i in (n0+1):n) {
	xbar <- updateMean(xbar, x[i,], i-1)
	pca <- perturbationRpca(pca$values, pca$vectors, x[i,], 
		i-1, center=xbar) }



