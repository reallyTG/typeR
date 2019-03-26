library(bpnreg)


### Name: residuals.bpnr
### Title: Residuals for a Bayesian circular regression model
### Aliases: residuals.bpnr

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
residuals(fit.Motor)
residuals(fit.Motor, type = "cos")




