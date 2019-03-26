library(tmvmixnorm)


### Name: rtmvt
### Title: Random number generation for truncated multivariate Student's t
###   distribution subject to linear inequality constraints
### Aliases: rtmvt

### ** Examples

# Example for full rank
d <- 3
rho <- 0.5
nu <- 10
Sigma <- matrix(0, nrow=d, ncol=d)
Sigma <- rho^abs(row(Sigma) - col(Sigma))

D1 <- diag(1,d) # Full rank

set.seed(1203)
ans.t <- rtmvt(n=1000, Mean=1:d, Sigma, nu=nu, D=D1, lower=rep(-1,d), upper=rep(1,d),
int=rep(0,d), burn=50, thin=0)

acf(ans.t)
apply(ans.t, 2, summary)




