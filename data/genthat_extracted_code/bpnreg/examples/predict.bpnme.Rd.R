library(bpnreg)


### Name: predict.bpnme
### Title: Predicted values for a Bayesian circular mixed-effects model
### Aliases: predict.bpnme

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
predict(fit.Motor)




