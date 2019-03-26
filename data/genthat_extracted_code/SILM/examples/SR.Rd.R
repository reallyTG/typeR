library(SILM)


### Name: SR
### Title: Support Recovery Procedure
### Aliases: SR

### ** Examples

## The function is intended for large n and p.
## Use small p here for illustration purpose only.
n <- 100
p <- 10
s0 <- 7
set <- 1:s0
Sigma <- matrix(NA, p, p)
for (i in 1:p) Sigma[i,] <- 0.9^(abs(i-(1:p)))
X <- matrix(rnorm(n*p), n, p)
X <- t(t(chol(Sigma))%*%t(X))
beta <- rep(0,p)
beta[1:s0] <- runif(s0,1,2)
Y <- X%*%beta+rt(n,4)/sqrt(2)
SR(X, Y)



