library(HGSL)


### Name: S_TISP_Path
### Title: S_TISP_Path Function
### Aliases: S_TISP_Path

### ** Examples

p <- 10
n <- 20
k <- 2
X <- matrix(0, n*k, p*k)
X[1:n, 1:p] <- rnorm(n*p)
X[(n+1):(k*n), (p+1):(p*k)] <- rnorm(n*p)
beta <- c(0:9, (0:9)/2)
y <- X %*% beta + rnorm(n*k)*0.1
grps <- rep(1:p, k)
lambdas <- (1:5)/2
index <- c(1, n, n+1, 2*n)
betaest <- S_TISP_Path(X, y, grps, k, index, lambdas)



