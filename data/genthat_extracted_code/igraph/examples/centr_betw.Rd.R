library(igraph)


### Name: centr_betw
### Title: Centralize a graph according to the betweenness of vertices
### Aliases: centr_betw centralization.betweenness

### ** Examples

# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g)$centralization
centr_clo(g, mode = "all")$centralization
centr_betw(g, directed = FALSE)$centralization
centr_eigen(g, directed = FALSE)$centralization



