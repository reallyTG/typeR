library(meteR)


### Name: metePhi
### Title: Equation of the METE species abundance distribution
### Aliases: metePhi
### Keywords: manip

### ** Examples

esf1=meteESF(spp=arth$spp,
              abund=arth$count,
              power=arth$mass^(.75),
              minE=min(arth$mass^(.75)))
metePhi(min(arth$mass^(.75)),
       esf1$La[1],esf1$La[2],
       esf1$Z,esf1$state.var['S0'],
       esf1$state.var['N0'],
       esf1$state.var['E0'])



