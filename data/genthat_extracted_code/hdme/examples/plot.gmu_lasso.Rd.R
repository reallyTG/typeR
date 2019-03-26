library(hdme)


### Name: plot.gmu_lasso
### Title: Plot the estimates returned by fit_gmu_lasso
### Aliases: plot.gmu_lasso

### ** Examples

set.seed(1)
n <- 200
p <- 50
s <- 10
beta <- c(rep(1,s),rep(0,p-s))
sdU <- 0.2

X <- matrix(rnorm(n*p),nrow = n,ncol = p)
W <- X + sdU * matrix(rnorm(n * p), nrow = n, ncol = p)

y <- rbinom(n, 1, (1 + exp(-X%*%beta))**(-1))
gmu_lasso <- fit_gmu_lasso(W, y)

plot(gmu_lasso)




