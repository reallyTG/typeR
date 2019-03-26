library(BMhyb)


### Name: LumpIntoClades
### Title: Lump into clades
### Aliases: LumpIntoClades

### ** Examples

	#set the number of non hybrid species
	ntax.nonhybrid<-5
	#set the number of hybrid species
	ntax.hybrid<-2
	#simulate a network
	network<-SimulateNetwork(ntax.nonhybrid=ntax.nonhybrid, ntax.hybrid=ntax.hybrid,
	flow.proportion=0.5, origin.type='clade', birth = 1, death = 0.5, sample.f = 0.5,
	tree.height = 1, allow.ghost=FALSE)
	#show the flow
	network$flow
	#show the new flow table
	LumpIntoClades(network$phy, network$flow)
	


