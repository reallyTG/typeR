library(grapherator)


### Name: getter
### Title: Getter functions.
### Aliases: getter getNumberOfNodes getNumberOfEdges getNumberOfClusters
###   getNumberOfWeights getNodeCoordinates getWeightMatrix
###   getAdjacencyMatrix getNodeDegrees

### ** Examples

g = graph(0, 100)
g = addNodes(g, n = 25, generator = addNodesGrid)
g = addEdges(g, generator = addEdgesGrid)
g = addWeights(g, generator = addWeightsRandom, method = runif, min = 5, max = 100, to.int = TRUE)
g = addWeights(g, generator = addWeightsDistance, method = "euclidean")

getNumberOfNodes(g)
getNumberOfEdges(g)
getNumberOfClusters(g)
getNumberOfWeights(g)
getNodeCoordinates(g)
getWeightMatrix(g, 2)
getAdjacencyMatrix(g)
getNodeDegrees(g)



