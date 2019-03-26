library(sparseSVM)


### Name: cv.sparseSVM
### Title: Cross validation for sparseSVM
### Aliases: cv.sparseSVM
### Keywords: models classification machine learning SVM

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
b = 3
w = 5*rnorm(10)
eps = rnorm(1000)
y = sign(b + drop(X[,1:10] %*% w + eps))

cv.fit1 <- cv.sparseSVM(X, y, nfolds = 5, ncores = 2, seed = 1234)
cv.fit2 <- cv.sparseSVM(X, y, nfolds = 5, seed = 1234)
stopifnot(all.equal(cv.fit1, cv.fit2))



