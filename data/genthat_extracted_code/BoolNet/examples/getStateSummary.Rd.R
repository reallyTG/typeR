library(BoolNet)


### Name: getStateSummary
### Title: Retrieve summary information on a state
### Aliases: getStateSummary
### Keywords: Boolean network transition state

### ** Examples

# load example data
data(cellcycle)

# get attractors
attractors <- getAttractors(cellcycle)

# print information for an arbitrary state
print(getStateSummary(attractors, c(1,1,1,1,1,1,1,1,1,1)))



