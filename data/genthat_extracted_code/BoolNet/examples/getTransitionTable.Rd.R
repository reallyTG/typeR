library(BoolNet)


### Name: getTransitionTable
### Title: Retrieve the transition table of a network
### Aliases: getTransitionTable
### Keywords: Boolean network transition transition table state

### ** Examples

# load example data
data(cellcycle)

# get attractors
attractors <- getAttractors(cellcycle)

# print the transition table
print(getTransitionTable(attractors))



