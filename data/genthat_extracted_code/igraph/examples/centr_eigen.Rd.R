library(igraph)


### Name: centr_eigen
### Title: Centralize a graph according to the eigenvector centrality of
###   vertices
### Aliases: centr_eigen centralization.evcent

### ** Examples

# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g)$centralization
centr_clo(g, mode = "all")$centralization
centr_betw(g, directed = FALSE)$centralization
centr_eigen(g, directed = FALSE)$centralization

# The most centralized graph according to eigenvector centrality
g0 <- make_graph(c(2,1), n = 10, dir = FALSE)
g1 <- make_star(10, mode = "undirected")
centr_eigen(g0)$centralization
centr_eigen(g1)$centralization



