library(rvinecopulib)


### Name: vine_predict_and_fitted
### Title: Predictions and fitted values for a vine copula model
### Aliases: vine_predict_and_fitted predict.vine fitted.vine fitted.vine

### ** Examples

x <- sapply(1:5, function(i) rnorm(50))
fit <- vine(x, copula_controls = list(family_set = "par"))
all.equal(predict(fit, x), fitted(fit))



