library(BoolNet)


### Name: sequenceToLaTeX
### Title: Create LaTeX table of state sequences
### Aliases: sequenceToLaTeX sequenceToLaTeX.BooleanNetwork
###   sequenceToLaTeX.data.frame
### Keywords: Boolean network state path sequence LaTeX

### ** Examples

# load example data
data(cellcycle)

# alternative 1: supply network and start state
# and export sequence to LaTeX
sequenceToLaTeX(network=cellcycle, 
                startState=rep(1,10), 
                includeAttractorStates="all",
                file="sequence.txt")

# alternative 2: calculate sequence in advance
sequence <- getPathToAttractor(cellcycle, 
                               state=rep(1,10), 
                               includeAttractorStates="all")

sequenceToLaTeX(sequence=sequence, 
                file="sequence.txt")



