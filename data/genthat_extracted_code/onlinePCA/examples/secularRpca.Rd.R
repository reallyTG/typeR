library(onlinePCA)


### Name: secularRpca
### Title: Recursive PCA Using Secular Equations
### Aliases: secularRpca

### ** Examples

# Initial data set
n <- 100	
d <- 50
x <- matrix(runif(n*d),n,d)
xbar <- colMeans(x)
pca0 <- eigen(cov(x))

# New observation
newx <- runif(d)

# Recursive PCA with secular equations
xbar <- updateMean(xbar, newx, n)
pca <- secularRpca(pca0$values, pca0$vectors, newx, n, center = xbar)



