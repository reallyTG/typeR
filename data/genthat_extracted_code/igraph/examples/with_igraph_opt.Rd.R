library(igraph)


### Name: with_igraph_opt
### Title: Run code with a temporary igraph options setting
### Aliases: with_igraph_opt

### ** Examples

with_igraph_opt(
  list(sparsematrices = FALSE),
  make_ring(10)[]
)
igraph_opt("sparsematrices")



