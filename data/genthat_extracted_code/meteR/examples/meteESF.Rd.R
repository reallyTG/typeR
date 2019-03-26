library(meteR)


### Name: meteESF
### Title: meteESF
### Aliases: meteESF
### Keywords: METE, MaxEnt, ecosystem function lagrange multiplier,
###   structure

### ** Examples

## case where complete data availible
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
esf1

## excluding metabolic rate data
esf2 <- meteESF(spp=arth$spp,
                abund=arth$count)
esf2

## using state variables only
esf3 <- meteESF(S0=50, N0=500, E0=5000)
esf3
esf4 <- meteESF(S0=50, N0=500)
esf4



