library(pez)


### Name: ConDivSim
### Title: Null models for functional-phylogenetic diversity
### Aliases: ConDivSim

### ** Examples

data(laja)
data <- comparative.comm(invert.tree, river.sites, invert.traits)
#Must have all species present in at least one community!
#...and must be presence-absence data
data <- data[,colSums(data$comm) > 0]
data$comm[data$comm>1] <- 1
sims <- ConDivSim(data)
#...without traits...
sims.phy <- ConDivSim(data, type="phy")



