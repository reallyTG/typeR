library(enpls)


### Name: print.enspls.fit
### Title: Print Fitted Ensemble Sparse Partial Least Squares Object
### Aliases: print.enspls.fit

### ** Examples

data("logd1k")
x = logd1k$x
y = logd1k$y

set.seed(42)
fit = enspls.fit(
  x, y, reptimes = 5, maxcomp = 3,
  alpha = c(0.3, 0.6, 0.9))
print(fit)



