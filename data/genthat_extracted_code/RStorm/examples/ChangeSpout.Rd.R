library(RStorm)


### Name: ChangeSpout
### Title: Function to change the Spout of a Topology
### Aliases: ChangeSpout
### Keywords: utilities programming

### ** Examples


# create a data set.
x <- seq(1, 100)
topology <- Topology(data.frame(x=x))

# Setup a simple topology to compute a sum
computeSum <- function(x, ...){
	sum <- GetHash("sum")
	if(is.data.frame(sum)){
		x <- sum + (x[1])
	}
	SetHash("sum", x)
}

# Run the stream
topology <- AddBolt(topology, Bolt(computeSum))
result <- RStorm(topology)
print(GetHash("sum", result))

# Create an alternative dataset
x2 <- seq(2, 100)

# Change the dataset in the existing topology
topology <- ChangeSpout(topology, data.frame(x=x2))

# Run the new dataset
result <- RStorm(topology)
print(GetHash("sum", result))




