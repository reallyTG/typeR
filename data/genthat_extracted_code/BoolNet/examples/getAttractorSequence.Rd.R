library(BoolNet)


### Name: getAttractorSequence
### Title: Decode the state sequence of a synchronous attractor
### Aliases: getAttractorSequence
### Keywords: Boolean network attractor cycle sequence state

### ** Examples

# load example data
data(cellcycle)

# get attractors
attractors <- getAttractors(cellcycle)

# print basin of 7-state attractor
print(getAttractorSequence(attractors, 2))




