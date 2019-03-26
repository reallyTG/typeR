library(sparseSVM)


### Name: plot.sparseSVM
### Title: Plot coefficients from a "sparseSVM" object
### Aliases: plot.sparseSVM
### Keywords: models classification machine learning SVM

### ** Examples

X = matrix(rnorm(1000*100), 1000, 100)
b = 3
w = 5*rnorm(10)
eps = rnorm(1000)
y = sign(b + drop(X[,1:10] %*% w + eps))

fit = sparseSVM(X, y)
par(mfrow = c(2,2))
plot(fit)
plot(fit, nvars = FALSE, alpha = 0.5)
plot(fit, log.l = FALSE)
plot(fit, xvar = "norm")



