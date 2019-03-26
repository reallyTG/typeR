library(grapherator)


### Name: plot.grapherator
### Title: Visualize graph.
### Aliases: plot.grapherator

### ** Examples

g = graph(0, 100)
g = addNodes(g, n = 25, generator = addNodesGrid)
g = addEdges(g, generator = addEdgesDelauney)
g = addWeights(g, generator = addWeightsDistance, method = "manhattan")
## Not run: 
##D pls = plot(g, weight.plot.type = "ecdf")
## End(Not run)

g = addWeights(g, generator = addWeightsRandom,
  method = rpois, lambda = 0.1)
## Not run: 
##D pls = plot(g, show.edges = FALSE)
## End(Not run)

g = graph(0, 100)
g = addNodes(g, n = 25, generator = addNodesGrid)
g = addNodes(g, n = 9, by.centers = TRUE, generator = addNodesGrid,
  lower = c(0, 0), upper = c(7, 7))
g = addEdges(g, generator = addEdgesDelauney)
g = addWeights(g, generator = addWeightsCorrelated, rho = -0.8)
## Not run: 
##D do.call(gridExtra::grid.arrange, plot(g, show.edges = FALSE))
##D do.call(gridExtra::grid.arrange, plot(g, show.edges = TRUE,
##D   show.cluster.centers = FALSE))
## End(Not run)



