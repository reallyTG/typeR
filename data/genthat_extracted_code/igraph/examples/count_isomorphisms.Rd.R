library(igraph)


### Name: count_isomorphisms
### Title: Count the number of isomorphic mappings between two graphs
### Aliases: count_isomorphisms graph.count.isomorphisms.vf2

### ** Examples

# colored graph isomorphism
g1 <- make_ring(10)
g2 <- make_ring(10)
isomorphic(g1, g2)

V(g1)$color <- rep(1:2, length = vcount(g1))
V(g2)$color <- rep(2:1, length = vcount(g2))
# consider colors by default
count_isomorphisms(g1, g2)
# ignore colors
count_isomorphisms(g1, g2, vertex.color1 = NULL,
    vertex.color2 = NULL)



