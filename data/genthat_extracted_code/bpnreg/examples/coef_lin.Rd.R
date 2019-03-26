library(bpnreg)


### Name: coef_lin
### Title: Linear coefficients
### Aliases: coef_lin

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
coef_lin(fit.Motor)




