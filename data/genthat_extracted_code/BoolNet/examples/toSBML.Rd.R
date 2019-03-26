library(BoolNet)


### Name: toSBML
### Title: Export a network to SBML
### Aliases: toSBML
### Keywords: SBML Boolean network file export

### ** Examples

# load the cell cycle network
data(cellcycle)

# export the network to SBML
toSBML(cellcycle, file="cellcycle.sbml")

# reimport the model
print(loadSBML("cellcycle.sbml"))



