library(netgen)


### Name: autoplot.Network
### Title: Autoplot function.
### Aliases: autoplot.Network

### ** Examples

## Not run: 
##D # here we have no depots ...
##D x = generateClusteredNetwork(n.points = 30L, n.cluster = 2L)
##D pl = autoplot(x, path = 1:3)
##D # ... and here we have two depots: the path visits the depots in this case
##D x = generateRandomNetwork(n.points = 30L, n.depots = 2L)
##D pl = autoplot(x, path = 1:3, path.colour = "tomato")
## End(Not run)



