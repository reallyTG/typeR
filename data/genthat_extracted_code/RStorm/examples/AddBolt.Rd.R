library(RStorm)


### Name: AddBolt
### Title: Function to add a 'Bolt' to a 'Topology' object to specify a
###   stream.
### Aliases: AddBolt
### Keywords: utilities programming

### ** Examples


# Create a topology and add a bolt to it.
bolt1 <- function(x, ...){print(x)}
topology <- Topology(data.frame(x=c(1:10)))
topology <- AddBolt(topology, Bolt(bolt1, listen=0))
topology




