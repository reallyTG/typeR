library(igraph)


### Name: union.igraph.es
### Title: Union of edge sequences
### Aliases: union.igraph.es

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
union(E(g)[1:6], E(g)[5:9], E(g)['A|J'])



