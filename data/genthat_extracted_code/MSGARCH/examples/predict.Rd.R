library(MSGARCH)


### Name: predict.MSGARCH_SPEC
### Title: predict method.
### Aliases: predict.MSGARCH_SPEC predict.MSGARCH_ML_FIT
###   predict.MSGARCH_MCMC_FIT

### ** Examples

# create specification
spec <- CreateSpec()

# load data
data("SMI", package = "MSGARCH")

# predict from specification
par <- c(0.1, 0.1, 0.8, 0.2, 0.1, 0.8, 0.99, 0.01)
set.seed(1234)
pred <- predict(object = spec, par = par, newdata = SMI, nahead = 5L)
head(pred)
plot(pred)

# predict from ML fit
fit <- FitML(spec = spec, data = SMI)
set.seed(1234)
pred <- predict(object = fit, nahead = 5L, do.return.draw = TRUE)
head(pred)
plot(pred)

## Not run: 
##D set.seed(1234)
##D fit <- FitMCMC(spec = spec, data = SMI)
##D pred <- predict(object = fit, nahead = 5L, do.return.draw = TRUE)
##D plot(pred)
## End(Not run)



