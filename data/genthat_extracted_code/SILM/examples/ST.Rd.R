library(SILM)


### Name: ST
### Title: Testing for Sparse Signals
### Aliases: ST

### ** Examples

## The function is intended for large n and p.
## Use small p here for illustration purpose only.
n <- 100
p <- 10
s0 <- 3
set <- 1:s0
Sigma <- matrix(NA, p, p)
for (i in 1:p) Sigma[i,] <- 0.9^(abs(i-(1:p)))
X <- matrix(rnorm(n*p), n, p)
X <- t(t(chol(Sigma))%*%t(X))
beta <- rep(0,p)
beta[1:s0] <- runif(s0,0,2)
Y <- X%*%beta+rt(n,4)/sqrt(2)
test.set <- (s0+1):p
sub.size <- n*0.3
ST(X, Y, sub.size, test.set)
test.set <- s0:p
ST(X, Y, sub.size, test.set)



