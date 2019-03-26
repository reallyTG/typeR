library(MXM)


### Name: Undirected path(s) between two nodes
### Title: Undirected path(s) between two nodes
### Aliases: undir.path
### Keywords: Undirected path

### ** Examples

# simulate a dataset with continuous data
set.seed(1234)
dataset <- matrix(runif(1000 * 20, 1, 100), nrow = 1000 ) 
G <- pc.con(dataset)$G
plotnetwork(G)
undir.path(G, 3, 4)
undir.path(G, 1, 3)



