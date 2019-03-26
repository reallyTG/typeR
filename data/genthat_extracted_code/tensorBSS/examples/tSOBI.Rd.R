library(tensorBSS)


### Name: tSOBI
### Title: SOBI for Tensor-Valued Time Series
### Aliases: tSOBI
### Keywords: multivariate array ts

### ** Examples

n <- 1000
S <- t(cbind(as.vector(arima.sim(n = n, list(ar = 0.9))),
             as.vector(arima.sim(n = n, list(ar = -0.9))),
             as.vector(arima.sim(n = n, list(ma = c(0.5, -0.5)))),
             as.vector(arima.sim(n = n, list(ar = c(-0.5, -0.3)))),
             as.vector(arima.sim(n = n, list(ar = c(0.5, -0.3, 0.1, -0.1), ma=c(0.7, -0.3)))),
             as.vector(arima.sim(n = n, list(ar = c(-0.7, 0.1), ma = c(0.9, 0.3, 0.1, -0.1))))))
dim(S) <- c(3, 2, n)

A1 <- matrix(rnorm(9), 3, 3)
A2 <- matrix(rnorm(4), 2, 2)

X <- tensorTransform(S, A1, 1)
X <- tensorTransform(X, A2, 2)

tsobi <- tSOBI(X)

MD(tsobi$W[[1]], A1)
MD(tsobi$W[[2]], A2) 
tMD(tsobi$W, list(A1, A2))




