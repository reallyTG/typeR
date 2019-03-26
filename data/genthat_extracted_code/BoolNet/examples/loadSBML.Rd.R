library(BoolNet)


### Name: loadSBML
### Title: Load an SBML document
### Aliases: loadSBML
### Keywords: SBML Boolean network file import

### ** Examples

# load the cell cycle network
data(cellcycle)

# export the network to SBML
toSBML(cellcycle, "cellcycle.sbml")

# reimport the model
print(loadSBML("cellcycle.sbml"))



