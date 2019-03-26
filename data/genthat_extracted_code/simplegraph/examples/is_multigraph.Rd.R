library(simplegraph)


### Name: is_multigraph
### Title: Is this a multigraph?
### Aliases: is_multigraph

### ** Examples

G <- graph(list(A = c("A", "B", "B"), B = c("A", "C"), C = "A"))
is_multigraph(G)

G2 <- simplify(G)
is_multigraph(G2)



