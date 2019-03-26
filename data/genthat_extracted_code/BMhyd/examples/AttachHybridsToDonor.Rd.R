library(BMhyd)


### Name: AttachHybridsToDonor
### Title: Attach hybrids to the donor species
### Aliases: AttachHybridsToDonor

### ** Examples

	#set the number of non hybrid species
	ntax.nonhybrid<-4
	#set the number of hybrid species
	ntax.hybrid<-1
	#simulate a network
	network<-SimulateNetwork(ntax.nonhybrid=ntax.nonhybrid, ntax.hybrid=ntax.hybrid, 
	flow.proportion=0.5, origin.type='clade', birth = 1, death = 0.5, sample.f = 0.5, 
	tree.height = 1, allow.ghost=FALSE)
	#show the tree. 
	network$phy
	#show the flow information
	network$flow
 	#Attach hybrid species to the donor and show the new tree. 
 	#The name of the hybrid is displayed with suffix  "_DUPLICATE"
	AttachHybridsToDonor(network$phy, network$flow, suffix="_DUPLICATE")
	


