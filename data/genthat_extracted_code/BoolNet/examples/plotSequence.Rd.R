library(BoolNet)


### Name: plotSequence
### Title: Plot a sequence of states
### Aliases: plotSequence
### Keywords: Boolean network state path sequence plot

### ** Examples

# load example data
data(cellcycle)

# alternative 1: supply network and start state
# and plot sequence as a table
plotSequence(network=cellcycle, 
             startState=rep(1,10), 
             includeAttractorStates="all")

# alternative 2: calculate sequence in advance
sequence <- getPathToAttractor(cellcycle, 
                               state=rep(1,10), 
                               includeAttractorStates="all")

# plot sequence as a graph
plotSequence(sequence=sequence, 
             mode="graph")



