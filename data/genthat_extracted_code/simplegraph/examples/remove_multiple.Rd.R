library(simplegraph)


### Name: remove_multiple
### Title: Remove multiple edges from a graph
### Aliases: remove_multiple

### ** Examples

G <- graph(list(A = c("A", "B", "B"), B = c("A", "C"), C = "A"))
is_multigraph(G)
is_multigraph(remove_multiple(G))



