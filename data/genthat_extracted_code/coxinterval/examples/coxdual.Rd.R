library(coxinterval)


### Name: coxdual
### Title: Cox model for a Markov illness-death process under dual
###   censoring
### Aliases: coxdual na.coxdual na.coxdual.default na.coxdual.data.frame
### Keywords: survival

### ** Examples

# Fit Cox model to dual-right--censored data
fit <- coxdual(Surv(start, stop, status) ~ cluster(id) + trans(from, to)
               + I(z * (to == 1)) + I(z * (from %in% 0 & to == 2))
               + I(z * (from %in% c(NA, 1) & to == 2)), data = dualrc,
               sieve.rate = 2/5)
fit
par(mfrow = c(1, 3))
by(fit$basehaz, fit$basehaz$trans, function(x) plot(x[, 2:1],
   type = "l", main = paste(x[1, 3]), xlim = c(0, 2), ylim = c(0, 4)))

# Fit Cox model to data with interval-censored progression times
fit <- coxdual(Surv(start, stop, status) ~ cluster(id) + trans(from, to)
               + I(z * (to == 1)) + I(z * (from %in% 0 & to == 2))
               + I(z * (from %in% c(NA, 1) & to == 2)), data = dualic)
fit
par(mfrow=c(1, 3))
by(fit$basehaz, fit$basehaz$trans, function(x) plot(x[, 2:1],
   type = "l", main = paste(x[1, 3]), xlim = c(0, 2), ylim = c(0, 4)))



