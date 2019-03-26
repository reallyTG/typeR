library(phylosim)


### Name: Log.PhyloSim
### Title: Save a message in the PhyloSim log file
### Aliases: Log.PhyloSim PhyloSim.Log Log,PhyloSim-method

### ** Examples

	# create a PhyloSim object,
	# with logLevel set to zero
	sim<-PhyloSim(log.level=0);
	# log a message
	Log(sim,"Hiya there!");
	# close log connection
	close(sim$.log.connection)
	# print out the log file
	cat(paste(scan(file=sim$LogFile,what=character(),sep="\n"),collapse="\n"));cat("\n");
	# clean up
	unlink(sim$logFile)
 


