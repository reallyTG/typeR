library(bpnreg)


### Name: coef_circ
### Title: Circular coefficients
### Aliases: coef_circ

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
coef_circ(fit.Motor)
coef_circ(fit.Motor, type = "categorical")




