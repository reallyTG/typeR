library(igraph)


### Name: decompose
### Title: Decompose a graph into components
### Aliases: decompose decompose.graph
### Keywords: graphs

### ** Examples


# the diameter of each component in a random graph
g <- sample_gnp(1000, 1/1000)
components <- decompose(g, min.vertices=2)
sapply(components, diameter)




