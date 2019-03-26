library(bpnreg)


### Name: predict.bpnr
### Title: Predicted values for a Bayesian circular regression model
### Aliases: predict.bpnr

### ** Examples

library(bpnreg)
fit.Motor <- bpnr(pred.I = Phaserad ~ 1 + Cond, data = Motor,
its = 100, burn = 10, n.lag = 3)
predict(fit.Motor)




