library(rvinecopulib)


### Name: bicop_predict_and_fitted
### Title: Predictions and fitted values for a bivariate copula model
### Aliases: bicop_predict_and_fitted predict.bicop fitted.bicop
###   fitted.bicop

### ** Examples

# Simulate and fit a bivariate copula model
u <- rbicop(500, "gauss", 0, 0.5)
fit <- bicop(u, "par", keep_data = TRUE)

# Predictions
all.equal(predict(fit, u, "hfunc1"), fitted(fit, "hfunc1"))



