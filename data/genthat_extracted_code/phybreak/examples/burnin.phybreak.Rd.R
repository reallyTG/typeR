library(phybreak)


### Name: burnin.phybreak
### Title: MCMC updating of a phybreak-object.
### Aliases: burnin.phybreak

### ** Examples

#First create a phybreak-object
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation)

MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 50)



