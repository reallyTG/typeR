library(igraph)


### Name: make_graph
### Title: Create an igraph graph from a list of edges, or a notable graph
### Aliases: make_graph graph.famous graph make_directed_graph
###   make_undirected_graph directed_graph undirected_graph

### ** Examples

make_graph(c(1, 2, 2, 3, 3, 4, 5, 6), directed = FALSE)
make_graph(c("A", "B", "B", "C", "C", "D"), directed = FALSE)

solids <- list(make_graph("Tetrahedron"),
               make_graph("Cubical"),
               make_graph("Octahedron"),
               make_graph("Dodecahedron"),
               make_graph("Icosahedron"))

graph <- make_graph( ~ A-B-C-D-A, E-A:B:C:D,
                      F-G-H-I-F, J-F:G:H:I,
                      K-L-M-N-K, O-K:L:M:N,
                      P-Q-R-S-P, T-P:Q:R:S,
                      B-F, E-J, C-I, L-T, O-T, M-S,
                      C-P, C-L, I-L, I-P)



