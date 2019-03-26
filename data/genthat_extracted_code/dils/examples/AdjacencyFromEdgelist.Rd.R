library(dils)


### Name: AdjacencyFromEdgelist
### Title: Convert an edgelist to an adjacency matrix
### Aliases: AdjacencyFromEdgelist

### ** Examples

edgelist <- cbind(expand.grid(letters[1:2], letters[1:2]), runif(4))
AdjacencyFromEdgelist(edgelist)



