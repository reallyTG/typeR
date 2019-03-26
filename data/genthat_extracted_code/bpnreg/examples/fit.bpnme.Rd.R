library(bpnreg)


### Name: fit.bpnme
### Title: Model fit for a Bayesian circular mixed-effects model
### Aliases: fit.bpnme

### ** Examples

library(bpnreg)
fit.Maps <- bpnme(pred.I = Error.rad ~ Maze + Trial.type + L.c + (1|Subject),
data = Maps,
its = 100, burn = 1, n.lag = 1)
fit(fit.Maps)




