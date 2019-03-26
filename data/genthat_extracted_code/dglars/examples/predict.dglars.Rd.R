library(dglars)


### Name: predict.dglars
### Title: Predict Method for dgLARS Fits.
### Aliases: predict predict.dglars
### Keywords: models regression

### ** Examples

######################
# Logistic regression model
set.seed(123)
n <- 100
p <- 10
X <- matrix(rnorm(n * p), n, p)
Xnew <- matrix(rnorm(n * p), n, p)
b <- 1:2
eta <- b[1] + X[, 1] * b[2]
mu <- binomial()$linkinv(eta)
y <- rbinom(n, 1, mu)
fit <- dglars.fit(X, y, binomial)
coef(fit)
predict(fit, type = "coefficients")
g <- seq(3, 1, by = -0.1)
coef(fit, g = g)
predict(fit, type = "coefficients", g = g)
predict(fit, type = "nnonzero")
predict(fit, type = "nnonzero", g = g)
predict(fit, type = "predictors")
predict(fit, type = "predictors", g = g)
predict(fit, type = "eta", g = g)
predict(fit, type = "eta", g = g, xnew = Xnew)
predict(fit, type = "mu", g = g)
predict(fit, type = "mu", g = g, xnew = Xnew)
predict(fit, type = "probability", g = g)
predict(fit, type = "probability", g = g, xnew = Xnew)
predict(fit, type = "class", g = g)
predict(fit, type = "class", g = g, xnew = Xnew)



