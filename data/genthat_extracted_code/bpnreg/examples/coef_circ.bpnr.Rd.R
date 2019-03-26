library(bpnreg)


### Name: coef_circ.bpnr
### Title: Obtain the circular coefficients of a Bayesian circular
###   regression model
### Aliases: coef_circ.bpnr

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
coef_circ(fit.Motor)
coef_circ(fit.Motor, type = "categorical")




