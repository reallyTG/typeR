library(grapherator)


### Name: addEdgesToPlot
### Title: Highlight edges in graph.
### Aliases: addEdgesToPlot

### ** Examples

## Not run: 
##D g = graph(0, 100)
##D g = addNodes(g, n = 10, generator = addNodesUniform)
##D g = addEdges(g, generator = addEdgesComplete)
##D pl = plot(g)$pl.coords
##D el = matrix(c(1, 2, 1, 3, 4, 5, 3, 4), nrow = 2L)
##D pl = addEdgesToPlot(pl, g, el)
##D print(pl)
## End(Not run)



