library(RStorm)


### Name: ShowFinalize
### Title: Function to display the name of the finalize function.
### Aliases: ShowFinalize
### Keywords: utilities programming

### ** Examples


# Simple display of the finalize function itself
topology <- Topology(data.frame(x=c(1:10), y=rep(1,10)))

bolt.1 <- function(x, ...){ SetHash("finalize", data.frame(x=99)) }
topology <- AddBolt(topology, Bolt(bolt.1))

comp.av <- function(object, ...){ 
	return( rep(object$finalize$x, 10)) }

topology <- AddFinalize(topology, Bolt(comp.av))
ShowFinalize(topology)

# and in the result object:
result <- RStorm(topology)
ShowFinalize(result)





