library(coxinterval)


### Name: const2lin
### Title: Accumulate values from a piecewise constant function of time
### Aliases: const2lin
### Keywords: survival

### ** Examples

fit <- coxdual(Surv(start, stop, status) ~ cluster(id)
               + trans(from, to) + z, data = dualrc, init.coxph = TRUE)
haz <- lin2const(fit$basehaz, stratum = 3)
Haz <- const2lin(haz, stratum = 3)
all(Haz == fit$basehaz)



