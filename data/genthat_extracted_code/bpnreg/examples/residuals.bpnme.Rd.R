library(bpnreg)


### Name: residuals.bpnme
### Title: Residuals for a Bayesian circular mixed-effects model
### Aliases: residuals.bpnme

### ** Examples

library(bpnreg)
fit.Maps <- bpnme(pred.I = Error.rad ~ Maze + Trial.type + L.c + (1|Subject),
data = Maps,
its = 100, burn = 1, n.lag = 1)
residuals(fit.Maps)
residuals(fit.Maps, type = "cos")




