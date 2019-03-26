library(dynamicGraph)


### Name: nameToVertexIndex
### Title: The indices of vertices
### Aliases: nameToVertexIndex
### Keywords: dynamic graphs

### ** Examples

Names <- c("Sex", "Age", "Eye", "FEV", "Hair", "Shosize")
Types <- rep("Discrete", 6)
vertices <- returnVertexList(Names, types = Types)
nameToVertexIndex(c("Sex", "Eye"), vertices)



