library(igraph)


### Name: rev.igraph.es
### Title: Reverse the order in an edge sequence
### Aliases: rev.igraph.es

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
E(g)
E(g) %>% rev()



