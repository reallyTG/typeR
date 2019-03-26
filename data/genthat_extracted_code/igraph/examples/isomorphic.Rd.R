library(igraph)


### Name: isomorphic
### Title: Decide if two graphs are isomorphic
### Aliases: isomorphic graph.isomorphic graph.isomorphic.34
###   graph.isomorphic.vf2 graph.isomorphic.bliss is_isomorphic_to

### ** Examples

# create some non-isomorphic graphs
g1 <- graph_from_isomorphism_class(3, 10)
g2 <- graph_from_isomorphism_class(3, 11)
isomorphic(g1, g2)

# create two isomorphic graphs, by permuting the vertices of the first
g1 <- barabasi.game(30, m=2, directed=FALSE)
g2 <- permute(g1, sample(vcount(g1)))
# should be TRUE
isomorphic(g1, g2)
isomorphic(g1, g2, method = "bliss")
isomorphic(g1, g2, method = "vf2")

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



