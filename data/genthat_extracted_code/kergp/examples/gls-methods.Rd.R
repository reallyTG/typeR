library(kergp)


### Name: gls-methods
### Title: Generalized Least Squares Estimation with a Given Covariance
###   Kernel
### Aliases: gls,covAll-method gls-methods

### ** Examples

## a possible 'covTS'
myCov <- covTS(inputs = c("Temp", "Humid"),
               kernel = "k1Matern5_2",
               dep = c(range = "input"),
               value = c(range = 0.4))
d <- myCov@d; n <- 100;
X <- matrix(runif(n*d), nrow = n, ncol = d)
colnames(X) <- inputNames(myCov)
## generate the 'GP part'  
C <- covMat(myCov, X = X)
L <- t(chol(C))
zeta <- L %*% rnorm(n)
## trend matrix 'F' for Ordinary Kriging
F <- matrix(1, nrow = n, ncol = 1)
varNoise <- 0.5
epsilon <- rnorm(n, sd = sqrt(varNoise))
beta <- 10
y <- F %*% beta + zeta + epsilon
fit <- gls(myCov, X = X, y = y, F = F, varNoise = varNoise)




