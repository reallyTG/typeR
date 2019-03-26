library(sparseSVM)


### Name: predict.cv.sparseSVM
### Title: Model predictions based on "cv.sparseSVM" object.
### Aliases: predict.cv.sparseSVM coef.cv.sparseSVM
### Keywords: models classification machine learning SVM

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
b = 3
w = 5*rnorm(10)
eps = rnorm(1000)
y = sign(b + drop(X[,1:10] %*% w + eps))

cv.fit <- cv.sparseSVM(X, y, ncores = 2, seed = 1234)
predict(cv.fit, X)
predict(cv.fit, type = 'nvars')
predict(cv.fit, type = 'coef')
coef(cv.fit)




