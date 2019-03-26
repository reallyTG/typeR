library(motmot.2.0)


### Name: transformPhylo.MCMC
### Title: Bayesian MCMC for models of trait evolution
### Aliases: transformPhylo.MCMC

### ** Examples

data(anolis.tree)
data(anolis.data)
attach(anolis.data)
male.length <- matrix(Male_SVL, dimnames=list(rownames(anolis.data)))
sortedData <- sortTraitData(anolis.tree, male.length)
phy <- sortedData$phy
male.length <- sortedData$trait
phy.clade <- extract.clade(phy, 182)
male.length.clade <- as.matrix(male.length[match(phy.clade$tip.label, rownames(male.length)),])
## please note, this model will be need to run for longer to achieve convergence
lambda.mcmc <- transformPhylo.MCMC(y=male.length.clade, phy=phy.clade, 
model="lambda", mcmc.iteration=100, burn.in=0.1)



