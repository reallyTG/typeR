library(predkmeans)


### Name: createPCAmodelmatrix
### Title: Create Principal Component Analysis (PCA) scores matrix
### Aliases: createPCAmodelmatrix

### ** Examples

n <- 100
d <- 15
X <- matrix(rnorm(n*d), ncol=d, nrow=n)
X <- as.data.frame(X)
mx <- createPCAmodelmatrix(data=X, ncomps=2)



