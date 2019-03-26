library(dglars)


### Name: logLik.dglars
### Title: Extract Log-Likelihood
### Aliases: logLik logLik.dglars print.loglik_dglars
### Keywords: models

### ** Examples

#################################
# y ~ Poisson

library(dglars)
set.seed(123)
n <- 100
p <- 5
X <- matrix(abs(rnorm(n*p)),n,p)
eta <- 1 + X[, 1]  + X[, 2]
mu <- poisson()$linkinv(eta)
y <- rpois(n, mu)
out <- dglars(y ~ X, poisson)
logLik(out)
logLik(out, g = seq(2, 0.5, by = -0.1))

############################
# y ~ Gamma

n <- 100
p <- 5
X <- matrix(abs(rnorm(n*p)),n,p)
eta <- 1 + 2 * X[, 1L]
mu <- drop(Gamma()$linkinv(eta))
shape <- 0.5
phi <- 1 / shape
y <- rgamma(n, scale = mu / shape, shape = shape)
out <- dglars(y ~ X, Gamma("log"))

# generalized Pearson statistic
logLik(out, phi = "pearson")

# deviance estimator
logLik(out, phi = "deviance")

# mle estimator
logLik(out, phi = "mle")

# grcv estimator
logLik(out, phi = "grcv")



