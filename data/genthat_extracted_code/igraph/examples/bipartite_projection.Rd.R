library(igraph)


### Name: bipartite_projection
### Title: Project a bipartite graph
### Aliases: bipartite_projection bipartite.projection
###   bipartite.projection.size bipartite_projection_size
### Keywords: graphs

### ** Examples


## Projection of a full bipartite graph is a full graph
g <- make_full_bipartite_graph(10,5)
proj <- bipartite_projection(g)
graph.isomorphic(proj[[1]], make_full_graph(10))
graph.isomorphic(proj[[2]], make_full_graph(5))

## The projection keeps the vertex attributes
M <- matrix(0, nr=5, nc=3)
rownames(M) <- c("Alice", "Bob", "Cecil", "Dan", "Ethel")
colnames(M) <- c("Party", "Skiing", "Badminton")
M[] <- sample(0:1, length(M), replace=TRUE)
M
g2 <- graph_from_incidence_matrix(M)
g2$name <- "Event network"
proj2 <- bipartite_projection(g2)
print(proj2[[1]], g=TRUE, e=TRUE)
print(proj2[[2]], g=TRUE, e=TRUE)




