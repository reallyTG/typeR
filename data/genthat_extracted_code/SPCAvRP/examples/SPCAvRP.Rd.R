library(SPCAvRP)


### Name: SPCAvRP
### Title: Computes the leading eigenvector using the SPCAvRP algorithm
### Aliases: SPCAvRP

### ** Examples

p <-  100 # dimension of data
k <- 10 # true sparsity level
n <- 1000 # number of observations
v1 <- c(rep(1/sqrt(k), k), rep(0,p-k)) # leading eigenvector
Sigma <- 2*tcrossprod(v1) + diag(p) # population covariance
mu <- rep(0, p) # population mean
X <- mvrnorm(n, mu, Sigma) # data matrix

spca <- SPCAvRP(data = X, cov = FALSE, l = k, d = k, A = 200, B = 70, center_data = FALSE)
spca$vector
spca$value



