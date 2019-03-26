library(meteR)


### Name: ipd
### Title: Individual Power Distribution
### Aliases: ipd ipd.meteESF
### Keywords: METE, MaxEnt, ecosystem function lagrange multiplier,
###   structure

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
               abund=arth$count,
               power=arth$mass^(.75),
               minE=min(arth$mass^(.75)))
ipd1 <- ipd(esf1)



