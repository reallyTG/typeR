library(grapherator)


### Name: as.character.grapherator
### Title: Graph string representation.
### Aliases: as.character.grapherator

### ** Examples

g = graph(lower = c(0, 0), upper = c(100, 100))
g = addNodes(g, n = 3, generator = addNodesUniform)
g = addNodes(g, n = 14, by.centers = TRUE, generator = addNodesUniform,
  lower = c(0, 0), upper = c(10, 10))
g = addEdges(g, generator = addEdgesWaxman, alpha = 0.2,
  beta = 0.2, type = "intracluster")
g = addEdges(g, generator = addEdgesDelauney, type = "intercenter")
g = addWeights(g, generator = addWeightsCorrelated, rho = -0.9)
g = addWeights(g, generator = addWeightsDistance, method = "euclidean")
as.character(g)



