library(enpls)


### Name: enspls.fit
### Title: Ensemble Sparse Partial Least Squares Regression
### Aliases: enspls.fit

### ** Examples

data("logd1k")
x = logd1k$x
y = logd1k$y

set.seed(42)
fit = enspls.fit(
  x, y, reptimes = 5, maxcomp = 3,
  alpha = c(0.3, 0.6, 0.9))
print(fit)
predict(fit, newx = x)



