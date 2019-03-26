library(hqreg)


### Name: plot.cv.hqreg
### Title: Plot the cross-validation curve for a "cv.hqreg" object
### Aliases: plot.cv.hqreg
### Keywords: models regression

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
beta = rnorm(10)
eps = 4*rnorm(1000)
y = drop(X[,1:10] %*% beta + eps)
cv = cv.hqreg(X, y, seed = 123)
plot(cv)



