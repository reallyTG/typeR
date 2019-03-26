library(EpiModel)


### Name: bipvals
### Title: Vertex Attributes for Bipartite Network
### Aliases: bipvals
### Keywords: internal netUtils

### ** Examples

nw <- network.initialize(n = 10, bipartite = 5)
nw <- set.vertex.attribute(nw, "male", rep(0:1, each = 5))
bipvals(nw, mode = 1, "male")




