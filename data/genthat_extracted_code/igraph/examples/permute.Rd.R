library(igraph)


### Name: permute
### Title: Permute the vertices of a graph
### Aliases: permute permute.vertices
### Keywords: graphs

### ** Examples


# Random permutation of a random graph
g <- sample_gnm(20, 50)
g2 <- permute(g, sample(vcount(g)))
graph.isomorphic(g, g2)

# Permutation keeps all attributes
g$name <- "Random graph, Gnm, 20, 50"
V(g)$name <- letters[1:vcount(g)]
E(g)$weight <- sample(1:5, ecount(g), replace=TRUE)
g2 <- permute(g, sample(vcount(g)))
graph.isomorphic(g, g2)
g2$name
V(g2)$name
E(g2)$weight
all(sort(E(g2)$weight) == sort(E(g)$weight))



