library(coxinterval)


### Name: lin2const
### Title: Slopes from values of a piecewise linear function of time
### Aliases: lin2const
### Keywords: survival

### ** Examples

data(dualrc)
fit <- coxdual(Surv(start, stop, status) ~ cluster(id)
               + trans(from, to) + z, data = dualrc, init.coxph = TRUE)
fit$basehaz
haz <- lin2const(fit$basehaz, stratum = 3)
Haz <- const2lin(haz, stratum = 3)
all(Haz == fit$basehaz)



