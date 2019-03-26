library(igraph)


### Name: vertex
### Title: Helper function for adding and deleting vertices
### Aliases: vertex vertices

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10])) +
  vertices('X', 'Y')
g
plot(g)



