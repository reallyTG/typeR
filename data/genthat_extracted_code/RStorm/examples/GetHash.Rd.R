library(RStorm)


### Name: GetHash
### Title: Function to retrieve objects stored locally during the running
###   of the stream.
### Aliases: GetHash
### Keywords: utilities programming

### ** Examples


# Create a topology with a spout:
topology <- Topology(data.frame(x=rnorm(100,0,1)))

# declare a bolt and add it to the topology
computeSum <- function(x, ...){
	sum <- GetHash("sum")  # get from local store
	if(is.data.frame(sum)){
		x <- sum + (x[1])
	}
	SetHash("sum", x)  # add to local store
}
topology <- AddBolt(topology, Bolt(computeSum))

# run the stream
result <- RStorm(topology)

# access the local store
print(GetHash("sum", result))




