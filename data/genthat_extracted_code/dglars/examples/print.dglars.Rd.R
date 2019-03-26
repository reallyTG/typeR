library(dglars)


### Name: print.dglars
### Title: Printing a dgLARS Object
### Aliases: print.dglars
### Keywords: models regression

### ** Examples

#############################
# y ~ Binomial
set.seed(123)
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



