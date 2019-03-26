library(dglars)


### Name: print.cvdglars
### Title: Print a cvdglars Object
### Aliases: print.cvdglars
### Keywords: models regression

### ** Examples

######################
# Logistic regression model

set.seed(123)

n <- 100
p <- 10
X <- matrix(rnorm(n*p) ,n, p)
b <- 1:2
eta <- b[1] + X[,1] * b[2]
mu <- binomial()$linkinv(eta)
y <- rbinom(n, 1, mu)
fit <- cvdglars.fit(X, y, family = "binomial")
fit



