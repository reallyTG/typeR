library(sparseSVM)


### Name: plot.cv.sparseSVM
### Title: Plot the cross-validation curve for a "cv.sparseSVM" object
### Aliases: plot.cv.sparseSVM
### Keywords: models classification machine learning SVM

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
b = 3
w = 5*rnorm(10)
eps = rnorm(1000)
y = sign(b + drop(X[,1:10] %*% w + eps))

cv.fit <- cv.sparseSVM(X, y, ncores = 2, seed = 1234)
plot(cv.fit)
plot(cv.fit, log.l = FALSE)



