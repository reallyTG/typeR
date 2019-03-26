library(igraph)


### Name: compose
### Title: Compose two graphs as binary relations
### Aliases: compose graph.compose %c%
### Keywords: graphs

### ** Examples


g1 <- make_ring(10)
g2 <- make_star(10, mode="undirected")
gc <- compose(g1, g2)
print_all(gc)
print_all(simplify(gc))




