library(igraph)


### Name: eigen_centrality
### Title: Find Eigenvector Centrality Scores of Network Positions
### Aliases: eigen_centrality evcent
### Keywords: graphs

### ** Examples


#Generate some test data
g <- make_ring(10, directed=FALSE)
#Compute eigenvector centrality scores
eigen_centrality(g)



