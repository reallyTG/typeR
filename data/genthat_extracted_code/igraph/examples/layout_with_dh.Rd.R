library(igraph)


### Name: layout_with_dh
### Title: The Davidson-Harel layout algorithm
### Aliases: layout_with_dh layout.davidson.harel with_dh

### ** Examples


set.seed(42)
## Figures from the paper
g_1b <- make_star(19, mode="undirected") + path(c(2:19, 2)) +
  path(c(seq(2, 18, by=2), 2))
plot(g_1b, layout=layout_with_dh)

g_2 <- make_lattice(c(8, 3)) + edges(1,8, 9,16, 17,24)
plot(g_2, layout=layout_with_dh)

g_3 <- make_empty_graph(n=70)
plot(g_3, layout=layout_with_dh)

g_4 <- make_empty_graph(n=70, directed=FALSE) + edges(1:70)
plot(g_4, layout=layout_with_dh, vertex.size=5, vertex.label=NA)

g_5a <- make_ring(24)
plot(g_5a, layout=layout_with_dh, vertex.size=5, vertex.label=NA)

g_5b <- make_ring(40)
plot(g_5b, layout=layout_with_dh, vertex.size=5, vertex.label=NA)

g_6 <- make_lattice(c(2,2,2))
plot(g_6, layout=layout_with_dh)

g_7 <- graph_from_literal(1:3:5 -- 2:4:6)
plot(g_7, layout=layout_with_dh, vertex.label=V(g_7)$name)

g_8 <- make_ring(5) + make_ring(10) + make_ring(5) +
  edges(1,6, 2,8, 3, 10, 4,12, 5,14,
        7,16, 9,17, 11,18, 13,19, 15,20)
plot(g_8, layout=layout_with_dh, vertex.size=5, vertex.label=NA)

g_9 <- make_lattice(c(3,2,2))
plot(g_9, layout=layout_with_dh, vertex.size=5, vertex.label=NA)

g_10 <- make_lattice(c(6,6))
plot(g_10, layout=layout_with_dh, vertex.size=5, vertex.label=NA)

g_11a <- make_tree(31, 2, mode="undirected")
plot(g_11a, layout=layout_with_dh, vertex.size=5, vertex.label=NA)

g_11b <- make_tree(21, 4, mode="undirected")
plot(g_11b, layout=layout_with_dh, vertex.size=5, vertex.label=NA)

g_12 <- make_empty_graph(n=37, directed=FALSE) +
  path(1:5,10,22,31,37:33,27,16,6,1) + path(6,7,11,9,10) + path(16:22) +
  path(27:31) + path(2,7,18,28,34) + path(3,8,11,19,29,32,35) +
  path(4,9,20,30,36) + path(1,7,12,14,19,24,26,30,37) +
  path(5,9,13,15,19,23,25,28,33) + path(3,12,16,25,35,26,22,13,3)
plot(g_12,  layout=layout_with_dh, vertex.size=5, vertex.label=NA)



