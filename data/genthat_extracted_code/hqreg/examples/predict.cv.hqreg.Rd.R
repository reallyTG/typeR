library(hqreg)


### Name: predict.cv.hqreg
### Title: Model predictions based on "cv.hqreg" object.
### Aliases: predict.cv.hqreg coef.cv.hqreg
### Keywords: models regression

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
beta = rnorm(10)
eps = 4*rnorm(1000)
y = drop(X[,1:10] %*% beta + eps) 
cv = cv.hqreg(X, y, seed = 1011)
predict(cv, X[1:5,])
predict(cv, X[1:5,], lambda = "lambda.min")
predict(cv, X[1:5,], lambda = 0.05)



