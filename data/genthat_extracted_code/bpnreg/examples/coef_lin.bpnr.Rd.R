library(bpnreg)


### Name: coef_lin.bpnr
### Title: Obtain the linear coefficients of a Bayesian circular regression
###   model
### Aliases: coef_lin.bpnr

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
coef_lin(fit.Motor)




