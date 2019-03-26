library(primer)


### Name: MetaSim
### Title: Simulation of Stochastic Metapopulation Models
### Aliases: MetaSim
### Keywords: methods

### ** Examples

out <- MetaSim(NSims=2)
pops <- out$Ns
matplot(out$t, pops, type='l')
title(sub=paste(out$method, "model"))



