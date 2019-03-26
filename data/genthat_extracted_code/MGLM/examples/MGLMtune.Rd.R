library(MGLM)


### Name: MGLMtune
### Title: Choose the tuning parameter value in sparse regression
### Aliases: MGLMtune

### ** Examples

set.seed(118)
n <- 50
p <- 10
d <- 5
m <- rbinom(n, 100, 0.8)
X <- matrix(rnorm(n * p), n, p)
alpha <- matrix(0, p, d)
alpha[c(1, 3, 5), ] <- 1
Alpha <- exp(X %*% alpha)
Y <- rdirmn(size=m, alpha=Alpha)
sweep <- MGLMtune(Y ~ 0 + X, dist="DM", penalty="sweep", ngridpt=10)
show(sweep)





