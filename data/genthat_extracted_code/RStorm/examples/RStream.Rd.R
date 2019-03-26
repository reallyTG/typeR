library(RStorm)


### Name: RStorm
### Title: Main function to run a stream.
### Aliases: RStorm is.RStorm print.RStorm plot.RStorm
### Keywords: utilities programming

### ** Examples


	# Run a simple RStorm. First, create some data:
	x <- seq(1, 1000)

	# Second, we start defining the topology
	topology <- Topology(data.frame(x=x))

	# Third, we define a bolt. 
	# This bolt computes the sum of a number stored 
	#   in a local Hashmap and the Tuple (x) that is received
	computeSum <- function(x, boltID, ...){
		sum <- GetHash(paste("sum", boltID))
		if(is.data.frame(sum)){
			x <- sum + (x[1])
		}
		SetHash(paste("sum", boltID), x)
		Emit(Tuple(x=x), ...)
	}

	# Add the bolts to the topology. 
	# Here the first bolt computes the sum of the sequence
	#   and the second bolt computes the sum of summed elements
	topology <- AddBolt(topology, Bolt(computeSum, listen=0, boltID=1))
	topology <- AddBolt(topology, Bolt(computeSum, listen=1, boltID=2))
	result <- RStorm(topology)
	print(GetHash("sum 1", result))
	print(GetHash("sum 2", result))



