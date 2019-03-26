library(phybreak)


### Name: thin_phybreak
### Title: Remove posterior samples from a phybreak-object.
### Aliases: thin_phybreak

### ** Examples

#First create a phybreak-object
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation$sequences, times = simulation$sample.times)
MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 20)
MCMCstate <- sample.phybreak(MCMCstate, nsample = 50, thin = 2)

MCMCstate <- thin_phybreak(MCMCstate, thin = 2)



