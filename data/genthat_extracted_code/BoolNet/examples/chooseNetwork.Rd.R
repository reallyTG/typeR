library(BoolNet)


### Name: chooseNetwork
### Title: Extract a single Boolean network from a probabilistic Boolean
###   network
### Aliases: chooseNetwork
### Keywords: Boolean network probabilistic Boolean network PBN conversion
###   reconstruction

### ** Examples

# load example data
data(examplePBN)

# extract a unique network
# - always use the first function
net <- chooseNetwork(examplePBN, rep(1, length(examplePBN$genes)))

# get attractors from this network
print(getAttractors(net))




