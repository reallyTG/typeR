library(phybreak)


### Name: transtree
### Title: Create a consensus transmission tree.
### Aliases: transtree

### ** Examples

#First build a phybreak-object containing samples.
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation)
MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 20)
MCMCstate <- sample.phybreak(MCMCstate, nsample = 50, thin = 2)

transtree(MCMCstate, method = "edmonds")
transtree(MCMCstate, method = "mpc", infection.times = "infector.sd")
plot(MCMCstate, plot.which = "mpc")



