library(igraph)


### Name: gsize
### Title: The size of the graph (number of edges)
### Aliases: gsize ecount

### ** Examples

g <- sample_gnp(100, 2/100)
gsize(g)

# Number of edges in a G(n,p) graph
replicate(100, sample_gnp(10, 1/2), simplify = FALSE) %>%
  vapply(gsize, 0) %>%
  hist()



