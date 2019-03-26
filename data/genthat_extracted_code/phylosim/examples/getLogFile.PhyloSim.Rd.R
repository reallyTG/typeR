library(phylosim)


### Name: getLogFile.PhyloSim
### Title: Get the name of the file used for logging
### Aliases: getLogFile.PhyloSim PhyloSim.getLogFile
###   getLogFile,PhyloSim-method

### ** Examples

	# Create a PhyloSim object
	sim<-PhyloSim();
	# get the name of the log file
	getLogFile(sim)
	# modify log file name
	setLogFile(sim,"OldLog.txt")
	# get/set log file name via virtual field
	sim$logFile
	sim$logFile<-"NewLog"
	sim$logFile
 


