library(BMhyb)


### Name: PlotNetwork
### Title: Phylogenetic Network Plot
### Aliases: PlotNetwork

### ** Examples

	#set the number of non hybrid species
	ntax.nonhybrid<-10
	#set the number of hybrid species
	ntax.hybrid<-3
	#simulate the network with desired species
	network<-SimulateNetwork(ntax.nonhybrid=ntax.nonhybrid, ntax.hybrid=ntax.hybrid,
	flow.proportion=0.5, origin.type='clade', birth = 1, death = 0.5, sample.f = 0.5,
	tree.height = 1, allow.ghost=FALSE)
	#plot the network
	PlotNetwork(network$phy,network$flow)
	


