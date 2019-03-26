library(netrankr)


### Name: transitive_reduction
### Title: Transitive Reduction
### Aliases: transitive_reduction

### ** Examples

library(igraph)

g <- threshold_graph(100,0.1)
P <- neighborhood_inclusion(g)
sum(P)

R <- transitive_reduction(P)
sum(R)



