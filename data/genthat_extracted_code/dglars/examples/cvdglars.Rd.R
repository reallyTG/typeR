library(dglars)


### Name: cvdglars
### Title: Cross-Validation Method for dgLARS
### Aliases: cvdglars cvdglars.fit
### Keywords: models regression

### ** Examples

###########################
# Logistic regression model
# y ~ Binomial
set.seed(123)
n <- 100
p <- 100
X <- matrix(rnorm(n * p), n, p)
b <- 1:2
eta <- b[1] + X[, 1] * b[2]
mu <- binomial()$linkinv(eta)
y <- rbinom(n, 1, mu)
fit_cv <- cvdglars.fit(X, y, family = binomial)
fit_cv



