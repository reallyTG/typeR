library(phybreak)


### Name: phylotree
### Title: Maximum clade credibility tree.
### Aliases: phylotree

### ** Examples

#First build a phybreak-object containing samples.
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation$sequences, times = simulation$sample.times)
MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 20)
MCMCstate <- sample.phybreak(MCMCstate, nsample = 50, thin = 2)

phylotree(MCMCstate)
plot(phylotree(MCMCstate, phylo.class = TRUE))



