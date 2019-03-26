library(comato)


### Name: edge.vector
### Title: Forming the edge vector of a conceptmap object
### Aliases: edge.vector

### ** Examples

#Create concept map from a random graph
require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
cm = conceptmap(g1)

edge.vector(cm)



