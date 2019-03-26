library(simplegraph)


### Name: is_loopy
### Title: Is this a loopy graph?
### Aliases: is_loopy

### ** Examples

G <- graph(list(A = c("A", "B", "B"), B = c("A", "C"), C = "A"))
is_loopy(G)

G2 <- simplify(G)
is_loopy(G2)



