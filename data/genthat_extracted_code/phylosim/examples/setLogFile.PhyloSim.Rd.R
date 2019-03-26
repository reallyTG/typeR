library(phylosim)


### Name: setLogFile.PhyloSim
### Title: Set the name of the file used for logging
### Aliases: setLogFile.PhyloSim PhyloSim.setLogFile
###   setLogFile,PhyloSim-method

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
 


