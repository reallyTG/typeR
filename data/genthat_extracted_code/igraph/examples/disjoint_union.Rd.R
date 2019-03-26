library(igraph)


### Name: disjoint_union
### Title: Disjoint union of graphs
### Aliases: disjoint_union graph.disjoint.union %du% %du%
### Keywords: graphs

### ** Examples


## A star and a ring
g1 <- make_star(10, mode="undirected")
V(g1)$name <- letters[1:10]
g2 <- make_ring(10)
V(g2)$name <- letters[11:20]
print_all(g1 %du% g2)



