library(bpnreg)


### Name: fit
### Title: Model fit
### Aliases: fit

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
fit(fit.Motor)





