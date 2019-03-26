library(RStorm)


### Name: Tuple
### Title: Function to create an object of type 'Tuple' to emit down a
###   stream.
### Aliases: Tuple is.Tuple
### Keywords: utilities programming

### ** Examples


# Example of a simple object emitted down a stream
spout <- data.frame(x=seq(1,4))
topology <- Topology(spout)

# The Emit function will check if the emitted object is indeed a Tuple
bolt.1 <- function(x, ...){
		Emit(Tuple(x), ...)
	}
	
bolt.2 <- function(x, ...){
	x <- as.numeric(x[1])
	print(x^2)
	}
	
topology <- AddBolt(topology, Bolt(bolt.1, listen=0))
topology <- AddBolt(topology, Bolt(bolt.1, listen=1))
topology <- AddBolt(topology, Bolt(bolt.2, listen=2))

result <- RStorm(topology)
#plot(topology)




