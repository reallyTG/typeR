library(netgen)


### Name: visualizePointMatching
### Title: Visualize point matching.
### Aliases: visualizePointMatching

### ** Examples

x = generateRandomNetwork(n.points = 20L, upper = 100)
y = generateClusteredNetwork(n.points = 20L, n.cluster = 2L, upper = 100)
## Not run: 
##D pm = getOptimalPointMatching(x$coordinates, y$coordinates)
##D print(visualizePointMatching(x, y, pm, highlight.longest = 2L))
## End(Not run)



