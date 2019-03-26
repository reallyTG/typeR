library(dglars)


### Name: plot.dglars
### Title: Plot from a dglars Object
### Aliases: plot.dglars
### Keywords: models regression

### ** Examples

###########################
# Logistic regression model
set.seed(123)
n <- 100
p <- 10
X <- matrix(rnorm(n * p), n, p)
b <- 1:2
eta <- b[1] + X[, 1] * b[2]
mu <- binomial()$linkinv(eta)
y <- rbinom(n, 1, mu)
fit <- dglars.fit(X, y, family = binomial)
plot(fit) 
plot(fit, type = "AIC")
plot(fit, type = "BIC")
plot(fit, type = "AIC", k = 5)
plot(fit, type = "AIC", complexity = "gdf")



