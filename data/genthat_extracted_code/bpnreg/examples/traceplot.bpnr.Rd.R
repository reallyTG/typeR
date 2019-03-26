library(bpnreg)


### Name: traceplot.bpnr
### Title: Traceplots for a Bayesian circular regression model
### Aliases: traceplot.bpnr

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
traceplot(fit.Motor, parameter = "B1")




