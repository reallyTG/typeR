library(BoolNet)


### Name: saveNetwork
### Title: Save a network
### Aliases: saveNetwork
### Keywords: Boolean network probabilistic Boolean network PBN file export

### ** Examples

# load the cell cycle network
data(cellcycle)

# save it to a file
saveNetwork(cellcycle, file="cellcycle.txt")

# reload the model
print(loadNetwork("cellcycle.txt"))



