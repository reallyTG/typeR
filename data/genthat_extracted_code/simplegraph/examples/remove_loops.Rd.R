library(simplegraph)


### Name: remove_loops
### Title: Remove loop edges from a graph
### Aliases: remove_loops

### ** Examples

G <- graph(list(A = c("A", "B", "B"), B = c("A", "C"), C = "A"))
is_loopy(G)
is_loopy(remove_loops(G))



