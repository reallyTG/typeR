library(dglars)


### Name: AIC.dglars
### Title: Akaike's An Information Criterion
### Aliases: AIC AIC.dglars BIC BIC.dglars
### Keywords: models

### ** Examples

#################################
# y ~ Pois

library("dglars")
set.seed(123)
n <- 100
p <- 5
X <- matrix(abs(rnorm(n*p)),n,p)
eta <- 1 + X[, 1]  + X[, 2]
mu <- poisson()$linkinv(eta)
y <- rpois(n, mu)
out <- dglars(y ~ X, poisson)
out
AIC(out)
AIC(out, g = seq(2, 1, by = -0.1))
AIC(out, complexity = "gdf")
AIC(out, k = log(n)) #BIC-values
BIC(out)

#################################
# y ~ Gamma

n <- 100
p <- 50
X <- matrix(abs(rnorm(n*p)),n,p)
eta <- 1 + 2 * X[, 1L]
mu <- drop(Gamma()$linkinv(eta))
shape <- 0.5
phi <- 1 / shape
y <- rgamma(n, scale = mu / shape, shape = shape)
out <- dglars(y ~ X, Gamma("log"))

AIC(out, phi = "pearson")
AIC(out, phi = "deviance")
AIC(out, phi = "mle")
AIC(out, phi = "grcv")



