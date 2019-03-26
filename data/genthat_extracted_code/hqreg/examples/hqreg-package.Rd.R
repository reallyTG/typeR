library(hqreg)


### Name: hqreg-package
### Title: Regularization Paths for Lasso or Elastic-net Penalized Huber
###   Loss Regression and Quantile Regression
### Aliases: hqreg-package
### Keywords: models regression

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
beta = rnorm(10)
eps = 4*rnorm(1000)
y = drop(X[,1:10] %*% beta + eps) 

# Huber loss
fit1 = hqreg(X, y)
coef(fit1, 0.01)
predict(fit1, X[1:5,], lambda = c(0.02, 0.01))
cv.fit1 = cv.hqreg(X, y)
plot(cv.fit1)

# Quantile loss
fit2 = hqreg(X, y, method = "quantile", tau = 0.2)
plot(fit2)

# Squared loss
fit3 = hqreg(X, y, method = "ls", preprocess = "rescale")
plot(fit3, xvar = "norm")



