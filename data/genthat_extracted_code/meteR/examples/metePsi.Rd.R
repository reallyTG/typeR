library(meteR)


### Name: metePsi
### Title: Equation of the PMF for the METE individual metabolic rate
###   distribution
### Aliases: metePsi
### Keywords: manip

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
metePsi(1:10,
        esf1$La[1],esf1$La[2],
        esf1$Z,esf1$state.var['S0'],
        esf1$state.var['N0'],
        esf1$state.var['E0'])



