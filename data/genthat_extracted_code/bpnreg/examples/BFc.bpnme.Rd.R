library(bpnreg)


### Name: BFc.bpnme
### Title: Bayes Factors for a Bayesian circular mixed-effects model
### Aliases: BFc.bpnme

### ** Examples

library(bpnreg)
fit.Maps <- bpnme(pred.I = Error.rad ~ Maze + Trial.type + L.c + (1|Subject),
data = Maps, its = 100, burn = 1, n.lag = 1)
BFc(fit.Maps, hypothesis = "Maze1 < Trial.type1")




