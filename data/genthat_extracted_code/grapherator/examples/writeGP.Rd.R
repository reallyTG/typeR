library(grapherator)


### Name: writeGP
### Title: Export/import graph.
### Aliases: writeGP readGP

### ** Examples

g = graph(0, 100)
g = addNodes(g, n = 25, generator = addNodesGrid)
g = addEdges(g, generator = addEdgesGrid)
g = addWeights(g, generator = addWeightsRandom, method = runif, min = 5, max = 100, to.int = TRUE)
g = addWeights(g, generator = addWeightsRandom, method = runif, min = 10, max = 100, to.int = TRUE)
## Not run: 
##D filename = tempfile()
##D writeGP(g, file = filename)
##D g2 = readGP(file = filename)
##D unlink(filename)
##D do.call(gridExtra::grid.arrange, c(plot(g), plot(g2), list(nrow = 2)))
## End(Not run)



