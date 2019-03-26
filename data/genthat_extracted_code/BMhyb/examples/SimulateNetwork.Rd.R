library(BMhyb)


### Name: SimulateNetwork
### Title: Simulate phylogenetic network
### Aliases: SimulateNetwork

### ** Examples

	library(TreeSim)
	#set up the number for non hybrid species
	non.hybrid <- 3
	#set up the number for hybrid species
	hybrid <- 1
	#set up the gene flow proportion
	flow<- 0.5
	#set up the hybridization type to original
	origins<- "individual"
	#start to simulate the network
	network<-SimulateNetwork(ntax.nonhybrid=non.hybrid, ntax.hybrid=hybrid,
	flow.proportion=flow, origin.type="individual", birth = 1, death = 0.5,
	sample.f = 0.5, tree.height = 1, allow.ghost=FALSE)
	#print out the result
	(network)
	


