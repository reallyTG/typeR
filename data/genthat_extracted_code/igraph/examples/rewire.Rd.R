library(igraph)


### Name: rewire
### Title: Rewiring edges of a graph
### Aliases: rewire

### ** Examples

g <- make_ring(10)
g %>%
  rewire(each_edge(p = .1, loops = FALSE)) %>%
  plot(layout=layout_in_circle)
print_all(rewire(g, with = keeping_degseq(niter = vcount(g) * 10)))



