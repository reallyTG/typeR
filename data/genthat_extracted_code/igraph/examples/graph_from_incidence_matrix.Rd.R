library(igraph)


### Name: graph_from_incidence_matrix
### Title: Create graphs from an incidence matrix
### Aliases: graph_from_incidence_matrix graph.incidence
###   from_incidence_matrix
### Keywords: graphs

### ** Examples


inc <- matrix(sample(0:1, 15, repl=TRUE), 3, 5)
colnames(inc) <- letters[1:5]
rownames(inc) <- LETTERS[1:3]
graph_from_incidence_matrix(inc)




