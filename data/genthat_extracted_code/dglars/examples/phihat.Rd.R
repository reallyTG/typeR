library(dglars)


### Name: phihat
### Title: Estimate the Dispersion Parameter
### Aliases: phihat
### Keywords: models regression

### ** Examples

############################
# y ~ Gamma

library("dglars")
set.seed(321)
n <- 100
p <- 50
X <- matrix(abs(rnorm(n*p)),n,p)
eta <- 1 + 2 * X[, 1L]
mu <- drop(Gamma()$linkinv(eta))
shape <- 0.5
phi <- 1 / shape
y <- rgamma(n, scale = mu / shape, shape = shape)
fit <- dglars(y ~ X, Gamma("log"))
g <- seq(range(fit$g)[1L], range(fit$g)[2L], length = 10)

# generalized Pearson statistic
phihat(fit, type = "pearson")
phihat(fit, type = "pearson", g = g)

# deviance estimator
phihat(fit, type = "deviance")
phihat(fit, type = "deviance", g = g)

# mle
phihat(fit, type = "mle")
phihat(fit, type = "mle", g = g)

# grcv
phihat(fit, type = "grcv")
phihat(fit, type = "grcv", g = g)



