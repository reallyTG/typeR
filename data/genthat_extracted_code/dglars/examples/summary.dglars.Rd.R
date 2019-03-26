library(dglars)


### Name: summary.dglars
### Title: Summaryzing dgLARS Fits
### Aliases: summary summary.dglars
### Keywords: models regression

### ** Examples

###########################
# Logistic regression model
set.seed(123)
n <- 100
p <- 10
X <- matrix(rnorm(n*p), n, p)
b <- 1:2
eta <- b[1] + X[, 1] * b[2]
mu <- binomial()$linkinv(eta)
y <- rbinom(n, 1, mu)
fit <- dglars(y ~ X, family = binomial)

summary(fit, type = "AIC")
summary(fit, type = "AIC", k = 0.1)
summary(fit, type = "AIC", complexity = "gdf")
summary(fit, type = "BIC", complexity = "df")
summary(fit, type = "BIC", complexity = "gdf")

############################
# y ~ Gamma
n <- 100
p <- 10
X <- matrix(abs(rnorm(n * p)), n, p)
eta <- 1 + 2 * X[, 1]
mu <- drop(Gamma()$linkinv(eta))
shape <- 0.5
phi <- 1 / shape
y <- rgamma(n, scale = mu / shape, shape = shape)
fit <- dglars(y ~ X, Gamma("log"))

summary(fit, phi = "pearson")
summary(fit, phi = "deviance")
summary(fit, phi = "mle")



