library(coxinterval)


### Name: coxdual.control
### Title: Control Cox model fit
### Aliases: coxdual.control
### Keywords: survival

### ** Examples

coxdual(Surv(start, stop, status) ~ cluster(id) + trans(from, to)
        + I(z * (to == 1)) + I(z * (from %in% 0 & to == 2))
        + I(z * (from %in% c(NA, 1) & to == 2)), data = dualrc,
        control = coxdual.control(eps = 1e-5, sieve.rate = 2/5))



