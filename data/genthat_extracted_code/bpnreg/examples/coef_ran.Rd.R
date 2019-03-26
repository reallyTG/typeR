library(bpnreg)


### Name: coef_ran
### Title: Random effect variances
### Aliases: coef_ran

### ** Examples

library(bpnreg)
fit.Maps <- bpnme(pred.I = Error.rad ~ Maze + Trial.type + L.c + (1|Subject),
data = Maps,
its = 100, burn = 1, n.lag = 1)
coef_ran(fit.Maps)
coef_ran(fit.Maps, type = "circular")





