library(meteR)


### Name: print.meteESF
### Title: print.meteESF
### Aliases: print.meteESF
### Keywords: METE, MaxEnt, ecosystem function lagrange multiplier,
###   structure

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
print(esf1)
esf1 # alternatively...



