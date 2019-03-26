library(netgen)


### Name: rescaleNetwork
### Title: Rescale network
### Aliases: rescaleNetwork

### ** Examples

## Not run: 
##D library(gridExtra)
##D x = generateClusteredNetwork(n.points = 100L, n.cluster = 4L, name = "Rescaling Demo")
##D 
##D # here we "stretch" the instance x direction to visualize the differences of
##D # the rescaling mehtods
##D x$coordinates[, 1] = x$coordinates[, 1] * 10L
##D x$upper = x$upper * 10L
##D pls = list(
##D   autoplot(x) + ggtitle("Original"),
##D   autoplot(rescaleNetwork(x, method = "by.dimension")) + ggtitle("By dimension"),
##D   autoplot(rescaleNetwork(x, method = "global")) + ggtitle("Global"),
##D   autoplot(rescaleNetwork(x, method = "global2")) + ggtitle("Global2")
##D )
##D pls$nrow = 1L
##D do.call(grid.arrange, pls)
## End(Not run)



