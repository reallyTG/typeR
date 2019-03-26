library(RStorm)


### Name: TrackRow
### Title: Function to store the value of some object in the stream over
###   time.
### Aliases: TrackRow
### Keywords: utilities programming

### ** Examples


# Create a topology with a simple spout
topology <- Topology(data.frame(x=c(1:10)))

# Define the bolt and add it 
computeSum <- function(x, ...){
	sum <- GetHash("sum")
	if(is.data.frame(sum)){
		x <- sum + (x[1])
	}
	SetHash("sum", x)
	TrackRow("sum", data.frame(x=x))
}
topology <- AddBolt(topology, Bolt(computeSum))

# Run the stream
result <- RStorm(topology)

# Insepct the result over the timepoints in the stream
GetTrack("sum", result)




