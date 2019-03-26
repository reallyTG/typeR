library(RStorm)


### Name: GetHashNames
### Title: Function to retrieve the names of locally stored objects in the
###   stream.
### Aliases: GetHashNames
### Keywords: utilities programming

### ** Examples


	# Create a topology
	topology <- Topology(data.frame(x=rnorm(100,0,1)))

	# Create two bolts and add them to the topology
	computeSum <- function(x, ...){
		sum <- GetHash("sum")
		if(is.data.frame(sum)){
			x <- sum + (x[1])
		}
		SetHash("sum", x)
	}
	computeSumSquared <- function(x, ...){
		sum2 <- GetHash("sum2")
		if(is.data.frame(sum2)){
			x <- sum2 + (x[1]^2)
		}
		SetHash("sum2", x)
	}
	topology <- AddBolt(topology, Bolt(computeSum))
	topology <- AddBolt(topology, Bolt(computeSumSquared))

	# Run the stream
	result <- RStorm(topology)

	# Get the names of all the stored objects during the stream
	print(GetHashNames(result))





