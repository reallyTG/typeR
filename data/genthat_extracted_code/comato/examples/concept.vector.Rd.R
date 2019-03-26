library(comato)


### Name: concept.vector
### Title: Forming the concept vector of a conceptmap object
### Aliases: concept.vector

### ** Examples

#Create concept map from a random graph
require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
cm = conceptmap(g1)

concept.vector(cm)



