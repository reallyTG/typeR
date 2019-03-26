library(UPSvarApprox)


### Name: Var_approx
### Title: Approximate the Variance of the Horvitz-Thompson estimator
### Aliases: Var_approx

### ** Examples


N <- 500; n <- 50

set.seed(0)
x <- rgamma(n=N, scale=10, shape=5)
y <- abs( 2*x + 3.7*sqrt(x) * rnorm(N) )

pik  <- n * x/sum(x)
pikl <- outer(pik, pik, '*'); diag(pikl) <- pik

### Variance approximations ---
Var_approx(y, pik, n, method = "Hajek1")
Var_approx(y, pik, n, method = "Hajek2")
Var_approx(y, pik, n, method = "HartleyRao1")
Var_approx(y, pik, n, method = "HartleyRao2")
Var_approx(y, pik, n, method = "FixedPoint")





