library(bpnreg)


### Name: BFc.bpnr
### Title: Bayes Factors for a Bayesian circular regression model
### Aliases: BFc.bpnr

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
BFc(fit.Motor, hypothesis = "Condsemi.imp < Condimp")




