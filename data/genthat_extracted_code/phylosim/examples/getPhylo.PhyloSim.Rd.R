library(phylosim)


### Name: getPhylo.PhyloSim
### Title: Get the phylo object aggregated in a PhyloSim object
### Aliases: getPhylo.PhyloSim PhyloSim.getPhylo getPhylo,PhyloSim-method

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
 


