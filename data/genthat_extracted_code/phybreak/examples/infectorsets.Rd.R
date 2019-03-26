library(phybreak)


### Name: infectorsets
### Title: Sampled infectors for each host in a phybreak-object.
### Aliases: infectorsets

### ** Examples

#First build a phybreak-object containing samples.
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation$sequences, times = simulation$sample.times)
MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 20)
MCMCstate <- sample.phybreak(MCMCstate, nsample = 50, thin = 2)

infectorsets(MCMCstate)



