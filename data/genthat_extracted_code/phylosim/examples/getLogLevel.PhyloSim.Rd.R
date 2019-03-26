library(phylosim)


### Name: getLogLevel.PhyloSim
### Title: Get the log level from a PhyloSim object
### Aliases: getLogLevel.PhyloSim PhyloSim.getLogLevel
###   getLogLevel,PhyloSim-method

### ** Examples

	# Create a PhyloSim object
	sim<-PhyloSim();
	# get/set log level
	getLogLevel(sim)
	setLogLevel(sim,0)
	# set/get log level via virtual field
	sim$logLevel<- -1
	sim$logLevel
	# clean up
	unlink(sim$logFile)
 


