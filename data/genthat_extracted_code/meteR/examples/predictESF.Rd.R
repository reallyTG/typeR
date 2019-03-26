library(meteR)


### Name: predictESF
### Title: predictESF
### Aliases: predictESF
### Keywords: METE, MaxEnt, ecosystem function lagrange multiplier,
###   structure

### ** Examples

## case where complete data availible
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
predictESF(esf1,
           abund=c(10,3),
           power=c(.01,3))



