library(simplegraph)


### Name: degree
### Title: Degree of vertices
### Aliases: degree

### ** Examples

G <- graph(list(A = c("B", "C"), B = "C", C = "A"))
degree(G, mode = "out")
degree(G, mode = "in")
degree(G, mode = "total")



