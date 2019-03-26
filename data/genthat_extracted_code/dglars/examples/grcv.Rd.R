library(dglars)


### Name: grcv
### Title: General Refitted Cross-Validation Estimator
### Aliases: grcv
### Keywords: models regression

### ** Examples

############################
# y ~ Gamma
set.seed(321)
n <- 100
p <- 50
X <- matrix(abs(rnorm(n*p)),n,p)
eta <- 1 + 2 * X[,1]
mu <- drop(Gamma()$linkinv(eta))
shape <- 0.5
phi <- 1 / shape
y <- rgamma(n, scale = mu / shape, shape = shape)
fit <- dglars(y ~ X, Gamma("log"))

phi
grcv(fit, type = "AIC")
grcv(fit, type = "BIC")



