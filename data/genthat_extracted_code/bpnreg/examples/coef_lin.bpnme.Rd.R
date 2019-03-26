library(bpnreg)


### Name: coef_lin.bpnme
### Title: Obtain the linear coefficients of a Bayesian circular
###   mixed-effects model
### Aliases: coef_lin.bpnme

### ** Examples

library(bpnreg)
fit.Maps <- bpnme(pred.I = Error.rad ~ Maze + Trial.type + L.c + (1|Subject),
data = Maps,
its = 100, burn = 1, n.lag = 1)
coef_lin(fit.Maps)




