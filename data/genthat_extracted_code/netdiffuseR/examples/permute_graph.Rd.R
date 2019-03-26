library(netdiffuseR)


### Name: permute_graph
### Title: Permute the values of a matrix
### Aliases: permute_graph CUG QAP rewire_permute rewire_qap

### ** Examples

# Simple example ------------------------------------------------------------
set.seed(1231)
g <- rgraph_ba(t=9)
g

# These preserve the density
permute_graph(g)
permute_graph(g)

# These are isomorphic to g
rewire_qap(g)
rewire_qap(g)




