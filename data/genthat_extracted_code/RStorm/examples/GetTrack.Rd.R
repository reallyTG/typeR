library(RStorm)


### Name: GetTrack
### Title: Function to retrieve objects stored using the 'SetTrack'
###   functionality during a stream.
### Aliases: GetTrack
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
GetTrack("sum", result)




