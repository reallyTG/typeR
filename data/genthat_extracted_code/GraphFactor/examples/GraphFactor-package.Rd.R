library(GraphFactor)


### Name: GraphFactor-package
### Title: Network Topology of Intravariable Clusters with Intervariable
###   Links
### Aliases: GraphFactor-package GraphFactor
### Keywords: package

### ** Examples

# Subset the data.
# Ensure the data is of data.frame class.

library(GraphFactor)
library(igraph)
library(datasets)

state77 <- state.x77[,c(1,2,3,5,7)]
state77 <- data.frame(state77)	#	# Make sure it's data.frame!

seex <- c(4,5,6,7,8)	# Data set indices to inspect with graphFactor.

graphFactor(dat = state77, datName = 'stateX77', showSequence = TRUE,
	buildSVD = FALSE, plotToFile = FALSE, minimumEventThreshold = 3, seqDex = seex)




