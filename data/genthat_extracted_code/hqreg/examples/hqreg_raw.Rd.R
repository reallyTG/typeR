library(hqreg)


### Name: hqreg_raw
### Title: Fit a robust regression model on raw data with Huber or quantile
###   loss penalized by lasso or elasti-net
### Aliases: hqreg_raw
### Keywords: models regression

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
beta = rnorm(10)
eps = 4*rnorm(1000)
y = drop(X[,1:10] %*% beta) + eps

# Huber loss
# include an intercept by default
fit1 = hqreg_raw(X, y)
coef(fit1, 0.01)
predict(fit1, X[1:5,], lambda = c(0.02, 0.01))

# no intercept
fit2 = hqreg_raw(X, y, intercept = FALSE)
plot(fit2)



