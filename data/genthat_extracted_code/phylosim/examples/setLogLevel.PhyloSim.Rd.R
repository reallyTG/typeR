library(phylosim)


### Name: setLogLevel.PhyloSim
### Title: Set the log level for a given PhyloSim object
### Aliases: setLogLevel.PhyloSim PhyloSim.setLogLevel
###   setLogLevel,PhyloSim-method

### ** Examples

	# Create a PhyloSim object
	sim<-PhyloSim();
	# get/set log level
	getLogLevel(sim)
	setLogLevel(sim,0)
	# set/get log level via virtual field
	sim$logLevel<- -1
	sim$logLevel
 


