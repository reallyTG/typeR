library(igraph)


### Name: keeping_degseq
### Title: Graph rewiring while preserving the degree distribution
### Aliases: keeping_degseq
### Keywords: graphs

### ** Examples

g <- make_ring(10)
g %>%
  rewire(keeping_degseq(niter = 20)) %>%
  degree()
print_all(rewire(g, with = keeping_degseq(niter = vcount(g) * 10)))



