library(RStorm)


### Name: SetHash
### Title: Function to store a 'data.frame' during a stream.
### Aliases: SetHash
### Keywords: utilities programming

### ** Examples


topology <- Topology(data.frame(x=rnorm(100,0,1)))
computeSum <- function(x, ...){
	sum <- GetHash("sum")
	if(is.data.frame(sum)){
		x <- sum + (x[1])
	}
	SetHash("sum", x)
}
topology <- AddBolt(topology, Bolt(computeSum))
result <- RStorm(topology)
print(GetHash("sum", result))





