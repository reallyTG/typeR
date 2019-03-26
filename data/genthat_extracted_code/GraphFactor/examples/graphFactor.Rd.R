library(GraphFactor)


### Name: graphFactor
### Title: Network Topology of Intravariable Clusters with Intervariable
###   Links
### Aliases: graphFactor
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(GraphFactor)
library(igraph)
library(datasets)

### Help files: ###

# # help(package = GraphFactor)
# # ?GraphFactor::GraphFactor
# # ?GraphFactor::graphFactor

data(USArrests)

graphFactor(dat = datasets::USArrests, datName = 'USArrests')
dev.new()
graphFactor(dat = datasets::USArrests, buildSVD = TRUE)
dev.new()
graphFactor(dat = datasets::USArrests, buildSVD = TRUE, minimumEventThreshold = 3)	
graphFactor(dat = datasets::USArrests, 
		 datName = 'USArrests', buildSVD = FALSE, minimumEventThreshold = 3)
# Not very exciting so far...

# Show a sequence of events.

# Put one value in seqDex.
graphFactor(dat = datasets::USArrests, showSequence = TRUE, seqDex = 1)
# Put a few values in seqDex.
graphFactor(dat = datasets::USArrests, showSequence = TRUE, seqDex = c(1,2,3))
graphFactor(dat = datasets::USArrests, showSequence = TRUE, seqDex = c(1,2,3), buildSVD = TRUE)

seex <- c(4,5,6)
graphFactor(dat = datasets::USArrests, showSequence = TRUE, seqDex = seex, 
		 buildSVD = FALSE, datName = 'USArrests', plotToFile = FALSE,
		minimumEventThreshold = 3)

# Try another data set.

data(state)

state77 <- state.x77[,c(1,2,3,5,7)]

head(state77)
class(state77)	# matrix.

state77 <- data.frame(state77)	#	# Make sure it's data.frame!

graphFactor(dat = state77, datName = 'stateX77', showSequence = FALSE,
	buildSVD = FALSE, plotToFile = FALSE, minimumEventThreshold = 2)

# Plot to file.
graphFactor(dat = state77, datName = 'stateX77', showSequence = TRUE,
	buildSVD = FALSE, plotToFile = TRUE, minimumEventThreshold = 2, seqDex = c(1,2,3))

# Increase the minimum threshold to place an edge between any two nodes.

# Don't plot to file...
graphFactor(dat = state77, datName = 'stateX77', showSequence = TRUE,
	buildSVD = FALSE, plotToFile = FALSE, minimumEventThreshold = 3, seqDex = seex)

# ...plot to file.
graphFactor(dat = state77, datName = 'stateX77', showSequence = TRUE,
	buildSVD = FALSE, plotToFile = TRUE, minimumEventThreshold = 3, seqDex = seex)

#X# graphFactor(dat = state77, datName = 'stateX77', showSequence = T,
#X# 	buildSVD = F, plotToFile = T, minimumEventThreshold = 2)
#X# #  Error. (no print...needs seqDex!)

graphFactor(dat = state77, datName = 'stateX77', showSequence = TRUE,
	buildSVD = FALSE, plotToFile = TRUE, minimumEventThreshold = 2, seqDex = seex)

# Pick a different subset of variables to inspect.
state76 <- state.x77[,c(1,2,3,5)]
state76 <- data.frame(state76)		

#X# graphFactor(dat = state76, datName = 'stateX77', showSequence = F,
#X# 	buildSVD = F, plotToFile = TRUE, minimumEventThreshold = 2)
#X# # 'plotToFile' failed because showSequence is set to FALSE!

# Note the presence of the sequence vector, seqDex, when showSequence is TRUE.
graphFactor(dat = state76, datName = 'stateX77', showSequence = TRUE,
	buildSVD = FALSE, plotToFile = TRUE, minimumEventThreshold = 2, 
	seqDex = c(1,2,3))

state75 <- data.frame(state.x77[,c(1,2,3)])
class(state75)	# data.frame.
graphFactor(dat = state75, datName = 'stateX77', showSequence = TRUE,
	buildSVD = FALSE, plotToFile = FALSE, minimumEventThreshold = 2, 
	seqDex = c(1,2,3))

graphFactor(dat = state75, datName = 'stateX77', showSequence = TRUE,
	buildSVD = FALSE, plotToFile = TRUE, minimumEventThreshold = 2, 
	seqDex = c(10,11,12))




