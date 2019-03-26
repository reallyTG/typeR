library(igraph)


### Name: c.igraph.es
### Title: Concatenate edge sequences
### Aliases: c.igraph.es

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
c(E(g)[1], E(g)['A|B'], E(g)[1:4])



