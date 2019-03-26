library(igraph)


### Name: centralize
### Title: Centralization of a graph
### Aliases: centralize centralization centralize.scores

### ** Examples

# A BA graph is quite centralized
g <- sample_pa(1000, m=4)
centr_degree(g)$centralization
centr_clo(g, mode="all")$centralization
centr_eigen(g, directed=FALSE)$centralization

# The most centralized graph according to eigenvector centrality
g0 <- graph( c(2,1), n=10, dir=FALSE )
g1 <- make_star(10, mode="undirected")
centr_eigen(g0)$centralization
centr_eigen(g1)$centralization



