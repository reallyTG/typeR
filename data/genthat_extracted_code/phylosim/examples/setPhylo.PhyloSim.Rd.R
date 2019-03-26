library(phylosim)


### Name: setPhylo.PhyloSim
### Title: Set the phylo object for a PhyloSim object
### Aliases: setPhylo.PhyloSim PhyloSim.setPhylo setPhylo,PhyloSim-method

### ** Examples

	#create a PhyloSim object
	sim<-PhyloSim();
	# creat a phylo object
	tree<-rcoal(3);
	# get/set phylo object
	setPhylo(sim,tree);
	getPhylo(sim,tree);
	# get/set phylo object via virtual field
	sim$tree<-rcoal(5);
	sim$tree;
 


