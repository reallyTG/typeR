library(HDCI)


### Name: PartRidge
### Title: Partial Ridge
### Aliases: PartRidge

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

## Partial Ridge Regression
# Lasso
set.seed(0)
obj.escv <- escv.glmnet(x, y)
obj <- Lasso(x, y, lambda = obj.escv$lambda.cv)
# variable set
betalasso <- obj$beta
selectvar <- betalasso != 0
# partial ridge 
PR.obj <- PartRidge(x = x, y = y, lambda2 = 1/n, varset = selectvar)
# parial ridge estimate of the regression coefficients
beta <- PR.obj$beta
# intercept term
beta0 <- PR.obj$beta0
# prediction
mypredict(PR.obj, newx = matrix(rnorm(10*p), 10, p))




