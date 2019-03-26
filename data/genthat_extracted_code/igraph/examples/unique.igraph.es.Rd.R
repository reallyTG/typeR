library(igraph)


### Name: unique.igraph.es
### Title: Remove duplicate edges from an edge sequence
### Aliases: unique.igraph.es

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
E(g)[1, 1:5, 1:10, 5:10]
E(g)[1, 1:5, 1:10, 5:10] %>% unique()



