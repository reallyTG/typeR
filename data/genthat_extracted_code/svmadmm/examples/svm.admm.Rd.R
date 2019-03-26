library(svmadmm)


### Name: svm.admm
### Title: linear/nonlinear svm solver based ADMM and IADMM algorithms
### Aliases: svm.admm

### ** Examples

library(svmadmm)
n = 100
p = 10
x = matrix(runif(2 * n * p, -1, 1), nrow = 2 * n)
y = sign(x[, 1])
y.ind = sample(1 : (2 * n), n / 10, replace = FALSE)
y[y.ind] = - y[y.ind]
x.tr = x[1 : n, ]
y.tr = y[1 : n]
x.te = x[-(1 : n), ]
y.te = y[-(1 : n)]
model = svm.admm(x.tr, y.tr)
fit = svm.predict(x.te, model)



