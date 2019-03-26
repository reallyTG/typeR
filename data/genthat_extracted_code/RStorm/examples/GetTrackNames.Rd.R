library(RStorm)


### Name: GetTrackNames
### Title: Function to retrieve the names of all tracked objects using
###   'SetTrack'
### Aliases: GetTrackNames
### Keywords: utilities programming

### ** Examples


	# Create a topology with a spout
	topology <- Topology(data.frame(x=c(1:10)))

	# Add a bolt to the topology
	computeSum <- function(x, ...){
		sum <- GetHash("sum")
		if(is.data.frame(sum)){
			x <- sum + (x[1])
		}
		SetHash("sum", x)
		# Track the current state during the stream:
		TrackRow("sum", data.frame(x=x))
	}
	topology <- AddBolt(topology, Bolt(computeSum))

	# Run the stream
	result <- RStorm(topology)

	# Inspect the sums during the stream
	GetTrackNames(result)




