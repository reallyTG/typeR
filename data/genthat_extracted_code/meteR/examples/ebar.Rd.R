library(meteR)


### Name: ebar
### Title: Relationship between mean metabolic rate (\bar{epsilon}) and
###   abundance
### Aliases: ebar
### Keywords: METE, MaxEnt, ecosystem function lagrange multiplier,
###   structure

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
               abund=arth$count,
               power=arth$mass^(.75),
               minE=min(arth$mass^(.75)))
damuth <- ebar(esf1)



