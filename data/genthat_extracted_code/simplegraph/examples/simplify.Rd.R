library(simplegraph)


### Name: simplify
### Title: Remove multiple and loop edges from a graph
### Aliases: simplify

### ** Examples

G <- graph(list(A = c("A", "B", "B"), B = c("A", "C"), C = "A"))
is_simple(G)

G2 <- simplify(G)
is_simple(G2)



