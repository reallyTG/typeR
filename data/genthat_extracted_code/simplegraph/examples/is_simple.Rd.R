library(simplegraph)


### Name: is_simple
### Title: Is this a simple graph?
### Aliases: is_simple

### ** Examples

G <- graph(list(A = c("A", "B", "B"), B = c("A", "C"), C = "A"))
is_simple(G)

G2 <- simplify(G)
is_simple(G2)



