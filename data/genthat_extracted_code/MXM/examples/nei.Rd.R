library(MXM)


### Name: Neighbours of nodes in an undirected graph
### Title: Returns the node(s) and their neighbour(s), if there are any.
### Aliases: nei
### Keywords: Network plot Neighbour nodes

### ** Examples

# simulate a dataset with continuous data
set.seed(1234)
dataset <- matrix(runif(1000 * 20, 1, 100), nrow = 1000 ) 
G <- pc.con(dataset)$G
plotnetwork(G)
dev.new()
nei( G, c(3, 4) )
nei( G, c(1, 3) )



