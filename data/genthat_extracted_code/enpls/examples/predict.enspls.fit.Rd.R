library(enpls)


### Name: predict.enspls.fit
### Title: Make Predictions from a Fitted Sparse Ensemble Partial Least
###   Squares Model
### Aliases: predict.enspls.fit

### ** Examples

data("logd1k")
x = logd1k$x
y = logd1k$y

set.seed(42)
fit = enspls.fit(x, y, reptimes = 5, maxcomp = 2)
y.pred = predict(fit, newx = x)
plot(y, y.pred, xlim = range(y), ylim = range(y))
abline(a = 0L, b = 1L)
y.pred.med = predict(fit, newx = x, method = "median")
plot(y, y.pred.med, xlim = range(y), ylim = range(y))
abline(a = 0L, b = 1L)



