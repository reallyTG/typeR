library(enpls)


### Name: predict.enpls.fit
### Title: Make Predictions from a Fitted Ensemble Partial Least Squares
###   Model
### Aliases: predict.enpls.fit

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
fit = enpls.fit(x, y, reptimes = 50)
y.pred = predict(fit, newx = x)
plot(y, y.pred, xlim = range(y), ylim = range(y))
abline(a = 0L, b = 1L)
y.pred.med = predict(fit, newx = x, method = "median")
plot(y, y.pred.med, xlim = range(y), ylim = range(y))
abline(a = 0L, b = 1L)



