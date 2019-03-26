library(sparseSVM)


### Name: sparseSVM
### Title: Fit sparse linear SVM with lasso or elasti-net regularization
### Aliases: sparseSVM
### Keywords: models classification machine learning SVM

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
b = 3
w = 5*rnorm(10)
eps = rnorm(1000)
y = sign(b + drop(X[,1:10] %*% w + eps))

fit = sparseSVM(X, y)
coef(fit, 0.05)
predict(fit, X[1:5,], lambda = c(0.2, 0.1))



