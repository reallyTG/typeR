library(bpnreg)


### Name: print.bpnr
### Title: Print output from a Bayesian circular regression model
### Aliases: print.bpnr

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
print(fit.Motor)




