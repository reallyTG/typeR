library(meteR)


### Name: spd
### Title: Species Power Distribution
### Aliases: spd spd.meteESF
### Keywords: METE, MaxEnt, ecosystem function lagrange multiplier,
###   structure

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
               abund=arth$count,
               power=arth$mass^(.75),
               minE=min(arth$mass^(.75)))
spd1 <- spd(esf1)



