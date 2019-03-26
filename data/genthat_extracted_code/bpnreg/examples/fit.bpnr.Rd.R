library(bpnreg)


### Name: fit.bpnr
### Title: Model fit for a Bayesian circular regression model
### Aliases: fit.bpnr

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
fit(fit.Motor)




