library(igraph)


### Name: rev.igraph.vs
### Title: Reverse the order in a vertex sequence
### Aliases: rev.igraph.vs

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
V(g) %>% rev()



