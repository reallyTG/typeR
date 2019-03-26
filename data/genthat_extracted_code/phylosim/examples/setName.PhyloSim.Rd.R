library(phylosim)


### Name: setName.PhyloSim
### Title: Set the name of a PhyloSim object
### Aliases: setName.PhyloSim PhyloSim.setName setName,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	o<-PhyloSim();
	# set/get name
	setName(o,"MySim");
	getName(o,"MySim");
	# set/get name via virtual field
	o$name<-"George";
	o$name
 


