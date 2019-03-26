library(igraph)


### Name: unique.igraph.vs
### Title: Remove duplicate vertices from a vertex sequence
### Aliases: unique.igraph.vs

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
V(g)[1, 1:5, 1:10, 5:10]
V(g)[1, 1:5, 1:10, 5:10] %>% unique()



