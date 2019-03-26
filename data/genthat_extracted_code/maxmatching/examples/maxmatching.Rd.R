library(maxmatching)


### Name: maxmatching
### Title: Maximum Matching
### Aliases: maxmatching

### ** Examples

# Unweighted general graph
G1 <- igraph::graph(c(1, 2, 1, 3, 1, 4, 3, 4, 3, 5,
5, 6, 6, 7, 7, 8, 8, 9, 3, 8, 5, 8), directed = FALSE)
maxmatching(G1, weighted = FALSE)
# Unweighted bipartite graph
G2 <- igraph::graph(c(1, 5, 1, 6, 1, 7, 2, 5, 2, 8,
3, 6, 3, 7, 3, 8, 4, 6, 4, 7, 4, 8), directed = FALSE)
maxmatching(G2, weighted = FALSE)
# Weighted bipartite graph
G3 <- igraph::graph(c(1, 5, 1, 6, 1, 7, 2, 5, 2, 8,
3, 6, 3, 7, 3, 8, 4, 6, 4, 7, 4, 8), directed = FALSE)
igraph::E(G3)$weight <- runif(length(igraph::E(G3)), 0, 1)
maxmatching(G3, weighted = TRUE)





