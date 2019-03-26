library(bpnreg)


### Name: print.bpnme
### Title: Print output from a Bayesian circular mixed-effects model
### Aliases: print.bpnme

### ** Examples

library(bpnreg)
fit.Maps <- bpnme(pred.I = Error.rad ~ Maze + Trial.type + L.c + (1|Subject),
data = Maps,
its = 100, burn = 1, n.lag = 1)
print(fit.Maps)




