library(netgen)


### Name: morphInstances
### Title: Morphing of two networks with a convex combination of the
###   coordinates.
### Aliases: morphInstances

### ** Examples

x = generateRandomNetwork(n.points = 40L, n.depots = 2L)
y = generateClusteredNetwork(n.points = 40L, n.cluster = 2L, n.depots = 2L)
z = morphInstances(x, y, alpha = 0.2)
## Not run: 
##D library(gridExtra)
##D plot.list = list(autoplot(x), autoplot(z), autoplot(y))
##D plot.list$nrow = 1
##D do.call(grid.arrange, plot.list)
## End(Not run)



