library(RStorm)


### Name: AddFinalize
### Title: Function to add a finalize function to a 'Topology'
### Aliases: AddFinalize
### Keywords: utilities programming

### ** Examples

	bolt1 <- function(x, ...){print(x)}
	topology <- Topology(data.frame(x=c(1:10)))
	topology <- AddFinalize(topology, Bolt(bolt1))
	topology



