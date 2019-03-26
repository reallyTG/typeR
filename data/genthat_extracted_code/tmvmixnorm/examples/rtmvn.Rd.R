library(tmvmixnorm)


### Name: rtmvn
### Title: Random number generation for truncated multivariate normal
###   distribution subject to linear inequality constraints
### Aliases: rtmvn

### ** Examples

# Example for full rank with strong dependence
d <- 3
rho <- 0.9
Sigma <- matrix(0, nrow=d, ncol=d)
Sigma <- rho^abs(row(Sigma) - col(Sigma))

D1 <- diag(1,d) # Full rank

set.seed(1203)
ans.1 <- rtmvn(n=1000, Mean=1:d, Sigma, D=D1, lower=rep(-1,d), upper=rep(1,d),
int=rep(0,d), burn=50)

acf(ans.1)
apply(ans.1, 2, summary)

# Example for non-full rank
d <- 3
rho <- 0.5
Sigma <- matrix(0, nrow=d, ncol=d)
Sigma <- rho^abs(row(Sigma) - col(Sigma))

D2 <- matrix(c(1,1,1,0,1,0,1,0,1),ncol=d)
qr(D2)$rank # 2

set.seed(1228)
ans.2 <- rtmvn(n=100, Mean=1:d, Sigma, D=D2, lower=rep(-1,d), upper=rep(1,d),
int=rep(0,d), burn=10)

acf(ans.2)
apply(ans.2, 2, summary)




