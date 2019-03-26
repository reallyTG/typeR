library(grapherator)


### Name: graph
### Title: Generate a bare graph.
### Aliases: graph

### ** Examples

# complete graph with one U(10, 20) sampled weight per edge
g = graph(0, 10)
g = addNodes(g, n = 10, generator = addNodesUniform)
g = addEdges(g, generator = addEdgesComplete)
g = addWeights(g, generator = addWeightsRandom, method = runif, min = 10, max = 20)
## Not run: 
##D do.call(gridExtra::grid.arrange, plot(g, show.edges = FALSE))
## End(Not run)

# we extend the graph by adding another weight which is based
# on the Euclidean distance between the node coordinates
g = addWeights(g, generator = addWeightsDistance, method = "euclidean")
## Not run: 
##D do.call(gridExtra::grid.arrange, plot(g, show.edges = FALSE))
## End(Not run)

# next we generate a graph with each two weights per edge which resembles
# a street network. The edge weights have a positive correlation.
g = graph(0, 100)
g = addNodes(g, n = 5, generator = addNodesLHS)
g = addNodes(g, n = c(10, 10, 15, 20, 50), by.centers = TRUE,
  generator = addNodesUniform, lower = c(0, 0), upper = c(10, 10))
g = addEdges(g, generator = addEdgesDelauney, type = "intracluster")
g = addEdges(g, generator = addEdgesDelauney, type = "intercluster", k = 4L)
g = addWeights(g, generator = addWeightsCorrelated, rho = 0.6)
## Not run: 
##D print(g)
##D do.call(gridExtra::grid.arrange, plot(g, show.edges = FALSE))
## End(Not run)



