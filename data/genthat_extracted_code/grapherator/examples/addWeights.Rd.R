library(grapherator)


### Name: addWeights
### Title: Add weights to graph.
### Aliases: addWeights

### ** Examples

# first we define a simple graph
g = graph(0, 100)
g = addNodes(g, n = 5, generator = addNodesLHS)
g = addNodes(g, n = c(3, 10, 20, 10, 40), by.centers = TRUE, generator = addNodesUniform,
  lower = c(0, 0), upper = c(15, 15))
g = addEdges(g, generator = addEdgesDelauney)

# first graph contains two integer random weights per edge
g1 = addWeights(g, generator = addWeightsRandom, method = runif, min = 10, max = 20, to.int = TRUE)
g1 = addWeights(g, generator = addWeightsRandom, method = runif, min = 10, max = 30, to.int = TRUE)
## Not run: 
##D plot(g1)$pl.weights
## End(Not run)

# next one contains correlated weights. The first weight corresponds to the
# Euclidean distance of the points, the second is generated in a way, that
# a given correlation rho is achieved.
g2 = addWeights(g, generator = addWeightsCorrelated, rho = -0.7)
## Not run: 
##D plot(g2)$pl.weights
## End(Not run)

# Last example contains two weights per edge: the first one is the Manhattan
# block distance between the nodes in the plane. The second one is the Euclidean
# distance plus a normally distributed jitter. Here we write a custom weight
# generator which returns two weight matrizes.
myWeightGenerator = function(graph, ...) {
  n = getNumberOfNodes(graph)
  adj.mat = getAdjacencyMatrix(graph)
  coords = getNodeCoordinates(graph)

  man.dist = as.matrix(dist(coords), method = "manhattan")
  euc.dist = as.matrix(dist(coords)) + abs(rnorm(n * n, ...))

  # keep in mind non-existent edges
  euc.dist[!adj.mat] = man.dist[!adj.mat] = Inf

  # return the necessary format
  return(list(weights = list(man.dist, euc.dist), generator = "MyWG"))
}

g3 = addWeights(g, generator = myWeightGenerator, mean = 30, sd = 5)
## Not run: 
##D plot(g3)$pl.weights
## End(Not run)



