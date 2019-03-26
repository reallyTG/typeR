library(grapherator)


### Name: addNodes
### Title: Add nodes to graph.
### Aliases: addNodes

### ** Examples

# Clustered graph
g = graph(0, 1000)
g = addNodes(g, n = 5, generator = addNodesLHS)
g = addNodes(g, n = c(3, 10, 20, 10, 40), by.centers = TRUE, generator = addNodesUniform,
 lower = c(0, 0), upper = c(30, 30))
## Not run: 
##D plot(g, show.edges = FALSE)$pl.coords
## End(Not run)

# Mixed graph
g = graph(0, 100)
g = addNodes(g, n = 100, generator = addNodesLHS)
g = addNodes(g, n = 100, generator = addNodesGrid)

## Not run: 
##D plot(g, show.edges = FALSE)$pl.coords
## End(Not run)



