library(phybreak)


### Name: get.phybreak
### Title: Accessing a phybreak object
### Aliases: get.phybreak get.tree get.parameters get.mcmc get.phylo
###   get.multiPhylo get.seqdata

### ** Examples

#First build a phybreak-object.
simulation <- sim.phybreak(obsize = 5)
MCMCstate <- phybreak(data = simulation)
MCMCstate <- burnin.phybreak(MCMCstate, ncycles = 20)
MCMCstate <- sample.phybreak(MCMCstate, nsample = 50, thin = 2)

get.tree(MCMCstate)
get.parameters(MCMCstate)
codaobject <- get.mcmc(MCMCstate, thin = 2)
plot.phylo(get.phylo(MCMCstate))
get.seqdata(MCMCstate)

#function from package phangorn:
phangorn::parsimony(get.phylo(MCMCstate), get.seqdata(MCMCstate))

tree0 <- get.phylo(MCMCstate)
seqdata <- get.seqdata(MCMCstate)
phangorn::pml(tree0, seqdata, 
              rate = 0.75*get.parameters(MCMCstate)["mu"]) 
logLik(MCMCstate, genetic = TRUE, withinhost = FALSE, 
       sampling = FALSE, generation = FALSE) 
              #should give the same result as 'pml'



