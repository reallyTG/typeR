library(phybreak)


### Name: logLik.phybreak
### Title: Log-likelihood of a phybreak-object.
### Aliases: logLik.phybreak

### ** Examples

#First build a phybreak-object containing samples.
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation)
logLik(MCMCstate)

MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 20)
logLik(MCMCstate)

tree0 <- get.phylo(MCMCstate)
seqdata <- get.seqdata(MCMCstate)
pml(tree0, seqdata, rate = 0.75*get.parameters(MCMCstate)["mu"]) 
logLik(MCMCstate, genetic = TRUE, withinhost = FALSE, 
       sampling = FALSE, generation = FALSE) #should give the same result as 'pml'



