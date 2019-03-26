library(coxinterval)


### Name: summary.coxinterval
### Title: Summary method for Cox model fit
### Aliases: summary.coxinterval print.summary.coxinterval
### Keywords: survival

### ** Examples

# Fit Cox model to dual-right--censored data
fit <- coxdual(Surv(start, stop, status) ~ cluster(id) + trans(from, to)
               + I(z * (to == 1)) + I(z * (from %in% 0 & to == 2))
               + I(z* (from %in% c(NA, 1) & to == 2)), data = dualrc,
               sieve.rate = 2/5)
fit



