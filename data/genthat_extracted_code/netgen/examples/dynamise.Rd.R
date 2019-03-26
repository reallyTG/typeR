library(netgen)


### Name: dynamise
### Title: Add dynamic arrival times to nodes.
### Aliases: dynamise

### ** Examples

x = generateClusteredNetwork(n.points = 100L, n.cluster = 4L, upper = 100, n.depots = 2L)
x = dynamise(x, dyn.customers.ratio = 0.3, arrival.limit = 400)
print(x)



