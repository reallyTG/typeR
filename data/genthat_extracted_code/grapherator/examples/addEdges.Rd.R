library(grapherator)


### Name: addEdges
### Title: Add edges to graph.
### Aliases: addEdges

### ** Examples

g = graph(0, 1000)
g = addNodes(g, n = 5, generator = addNodesLHS)
g = addNodes(g, n = c(3, 10, 20, 10, 40), by.centers = TRUE, generator = addNodesUniform,
  lower = c(0, 0), upper = c(30, 30))
# user different edge generators for clusters
g = addEdges(g, generator = addEdgesDelauney, type = "intracluster", cluster.ids = 1:3)
g = addEdges(g, generator = addEdgesSpanningTree, type = "intracluster", cluster.ids = 4:5)
# link cluster centers
g = addEdges(g, generator = addEdgesSpanningTree, runs = 2, type = "intercenter")
# additional random links between each 2 nodes from each cluster
g = addEdges(g, generator = addEdgesGilbert, p = 0.4, type = "intercluster", k = 2)



