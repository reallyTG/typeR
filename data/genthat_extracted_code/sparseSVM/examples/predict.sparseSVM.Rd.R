library(sparseSVM)


### Name: predict.sparseSVM
### Title: Model predictions based on "sparseSVM" object.
### Aliases: predict.sparseSVM coef.sparseSVM
### Keywords: models classification machine learning SVM

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
b = 3
w = 5*rnorm(10)
eps = rnorm(1000)
y = sign(b + drop(X[,1:10] %*% w + eps))

fit = sparseSVM(X, y)
predict(fit, X[1:5,], lambda = c(0.05, 0.03))
predict(fit, X[1:5,], lambda = 0.05, exact = TRUE)
predict(fit, type = "nvars")
coef(fit, lambda = 0.05)



