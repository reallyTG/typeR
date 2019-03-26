library(multinet)


### Name: Navigation
### Title: Functions to extract neighbors of nodes, to navigate the network
### Aliases: Navigation neighbors.ml xneighbors.ml

### ** Examples

net <- ml.aucs()
# out-neighbors of U54, that is, all A such that there is an edge ("U54",A)
neigh <- neighbors.ml(net, "U54", mode="out")
# all in-neighbors of U54 on the "work" layer who are not in-neighbors
# in any other layer
xneigh <- xneighbors.ml(net, "U54", "work", mode="in")
# all neighbors (in- and out-) of U54 on the "work" and "lunch" layers
# who are not neighbors in any other layer
xneigh <- xneighbors.ml(net, "U54", c("work","lunch"))



