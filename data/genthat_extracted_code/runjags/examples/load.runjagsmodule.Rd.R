library(runjags)


### Name: load.runjagsmodule
### Title: Load the internal JAGS module provided by runjags
### Aliases: load.runjagsmodule load.runJAGSmodule unload.runjagsmodule
###   unload.runJAGSmodule
### Keywords: methods

### ** Examples

	
	# Load the module for use with any rjags model:
	available <- load.runjagsmodule(fail=FALSE)
	if(available){
		# A simple model to sample from a Lomax distribution.	
		# (Requires the rjags or rjparallel methods)
		m <- "model{
			L ~ dlomax(1,1)
		}"	
		results <- run.jags(m, monitor="L", method="rjags", 
		modules="runjags")
	}



