library(BoolNet)


### Name: getPathToAttractor
### Title: Get state transitions between a state and its attractor
### Aliases: getPathToAttractor
### Keywords: Boolean network sequence path basin attractor

### ** Examples

# load example network
data(cellcycle)

# get path from a state to its attractor
# include all attractor states
path <- getPathToAttractor(cellcycle, rep(1,10), 
                           includeAttractorStates="all")
print(path)

# include only the first attractor state
path <- getPathToAttractor(cellcycle, rep(1,10), 
                           includeAttractorStates="first")
print(path)

# exclude attractor states
path <- getPathToAttractor(cellcycle, rep(1,10), 
                           includeAttractorStates="none")
print(path)



