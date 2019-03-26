library(sharpshootR)


### Name: component.adj.matrix
### Title: Create an adjacency matrix from a data.frame of component data
### Aliases: component.adj.matrix
### Keywords: manip

### ** Examples

# load sample data set
data(amador)

# convert into adjacency matrix
m <- component.adj.matrix(amador)

# plot network diagram, with Amador soil highlighted
plotSoilRelationGraph(m, s='amador')



