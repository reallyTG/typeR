library(hqreg)


### Name: cv.hqreg
### Title: Cross-validation for hqreg
### Aliases: cv.hqreg
### Keywords: models regression

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
beta = rnorm(10)
eps = 4*rnorm(1000)
y = drop(X[,1:10] %*% beta + eps)
cv = cv.hqreg(X, y, seed = 123)
plot(cv)

cv_raw = cv.hqreg(X, y, FUN = "hqreg_raw", seed = 321)
predict(cv_raw, X[1:5,])

# parallel cross validation
## Not run: 
##D cv_parallel = cv.hqreg(X, y, ncores = 5)
##D plot(cv_parallel)
## End(Not run)



