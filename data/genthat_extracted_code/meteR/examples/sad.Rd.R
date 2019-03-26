library(meteR)


### Name: sad
### Title: METE species abundance distribution
### Aliases: sad sad.meteESF
### Keywords: METE, MaxEnt, ecosystem function lagrange multiplier,
###   structure

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
sad1 <- sad(esf1)
sad1
sad1$r(20)
sad1$q(seq(0,1,length=10))



