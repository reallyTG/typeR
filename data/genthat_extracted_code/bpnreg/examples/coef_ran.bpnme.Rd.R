library(bpnreg)


### Name: coef_ran.bpnme
### Title: Obtain random effect variances of a Bayesian circular
###   mixed-effects model
### Aliases: coef_ran.bpnme

### ** Examples

library(bpnreg)
fit.Maps <- bpnme(pred.I = Error.rad ~ Maze + Trial.type + L.c + (1|Subject),
data = Maps,
its = 100, burn = 1, n.lag = 1)
coef_ran(fit.Maps)
coef_ran(fit.Maps, type = "circular")




