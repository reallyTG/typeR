library(phybreak)


### Name: sample.phybreak
### Title: Sampling from a phybreak MCMC-chain.
### Aliases: sample.phybreak

### ** Examples

#First create a phybreak-object
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation)

MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 20)
MCMCstate <- sample.phybreak(MCMCstate, nsample = 50, thin = 2)



