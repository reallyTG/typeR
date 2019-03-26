library(phybreak)


### Name: plotTrans
### Title: Plotting a phybreak object transmission tree.
### Aliases: plotTrans

### ** Examples

#First build a phybreak-object containing samples.
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation$sequences, times = simulation$sample.times)
MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 20)
MCMCstate <- sample.phybreak(MCMCstate, nsample = 50, thin = 2)

plot(MCMCstate, plot.which = "mpc")



