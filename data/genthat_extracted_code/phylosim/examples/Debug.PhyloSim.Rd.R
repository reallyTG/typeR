library(phylosim)


### Name: Debug.PhyloSim
### Title: Save a debug message in the PhyloSim log file
### Aliases: Debug.PhyloSim PhyloSim.Debug Debug,PhyloSim-method

### ** Examples

	# create a PhyloSim object,
	# with logLevel set to zero
	sim<-PhyloSim(log.level=0);
	# log a debug message
	Debug(sim,"Some useful detail...");
	# close log connection
	close(sim$.log.connection)
	# print out the log file
	cat(paste(scan(file=sim$LogFile,what=character(),sep="\n"),collapse="\n"));cat("\n");
	# clean up
	unlink(sim$logFile)
 


