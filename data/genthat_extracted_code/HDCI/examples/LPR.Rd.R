library(HDCI)


### Name: LPR
### Title: Lasso Partial Ridge
### Aliases: LPR

### ** Examples

library("glmnet")
library("mvtnorm") 

## generate the data
set.seed(2015)
n <- 200      # number of obs
p <- 500
s <- 10
beta <- rep(0, p)
beta[1:s] <- runif(s, 1/3, 1)
x <- rmvnorm(n = n, mean = rep(0, p), method = "svd")
signal <- sqrt(mean((x %*% beta)^2))
sigma <- as.numeric(signal / sqrt(10))  # SNR=10
y <- x %*% beta + rnorm(n)

## Lasso+Partial Ridge estimator
# for a given value of lambda
set.seed(0)
obj.escv <- escv.glmnet(x, y)
obj <- LPR(x, y, lambda = obj.escv$lambda.cv)
# Lasso+OLS estimate of the regression coefficients
obj$beta
# intercept term
obj$beta0
# prediction
mypredict(obj, newx = matrix(rnorm(10*p), 10, p))

# for lambda choosing by cross-validation (cv) which uses Lasso+OLS in the cv fit
set.seed(0)
obj <- LPR(x, y, fix.lambda = FALSE)

# for lambda choosing by cross-validation (cv) which uses Lasso in the cv fit
set.seed(0)
obj <- LPR(x, y, fix.lambda = FALSE, cv.OLS = FALSE)




