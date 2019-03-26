library(simplegraph)


### Name: sanitize
### Title: Check the validity of a graph data structure
### Aliases: sanitize

### ** Examples

G <- graph(list(A = c("B", "C"), B = "C", C = "A"))
sanitize(G)

G <- c(G, list("this is not good" = c(1, 2, 3)))
try(sanitize(G))



