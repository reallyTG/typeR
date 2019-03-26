library(rvinecopulib)


### Name: vinecop_predict_and_fitted
### Title: Predictions and fitted values for a vine copula model
### Aliases: vinecop_predict_and_fitted predict.vinecop fitted.vinecop
###   fitted.vinecop

### ** Examples

u <- sapply(1:5, function(i) runif(50))
fit <- vinecop(u, "par", keep_data = TRUE)
all.equal(predict(fit, u), fitted(fit))



