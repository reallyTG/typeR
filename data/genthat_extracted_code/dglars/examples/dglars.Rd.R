library(dglars)


### Name: dglars
### Title: dgLARS Solution Curve for GLM
### Aliases: dglars dglars.fit
### Keywords: models regression

### ** Examples

set.seed(123)

#############################
# y ~ Binomial
n <- 100
p <- 100
X <- matrix(rnorm(n * p), n, p)
eta <- 1 + 2 * X[,1]
mu <- binomial()$linkinv(eta)
y <- rbinom(n, 1, mu)
fit <- dglars(y ~ X, family = binomial)
fit

# adaptive dglars method
b_wght <- coef(fit)$beta[, 20]
fit <- dglars(y ~ X, family = binomial, b_wght = b_wght) 
fit 

# the first three coefficients are not penalized
fit <- dglars(y ~ X, family = binomial, unpenalized = 1:3) 
fit 

# 'probit' link function
fit <- dglars(y ~ X, family = binomial("probit"))
fit

############################
# y ~ Poisson 
n <- 100
p <- 100
X <- matrix(rnorm(n * p), n, p)
eta <- 2 + 2 * X[,1]
mu <- poisson()$linkinv(eta)
y <- rpois(n, mu)
fit <- dglars(y ~ X, family = poisson)
fit

############################
# y ~ Gamma
n <- 100
p <- 100
X <- matrix(abs(rnorm(n*p)),n,p)
eta <- 1 + 2 * X[,1]
mu <- drop(Gamma()$linkinv(eta))
shape <- 0.5
phi <- 1 / shape
y <- rgamma(n, scale = mu / shape, shape = shape)
fit <- dglars(y ~ X, Gamma("log"))
fit



