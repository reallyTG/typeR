library(netrankr)


### Name: dominance_graph
### Title: Partial ranking as directed graph
### Aliases: dominance_graph

### ** Examples

library(igraph)
g <- threshold_graph(20,0.1)
P <- neighborhood_inclusion(g)
d <- dominance_graph(P)
## Not run: plot(d)

# to reduce overplotting use transitive reduction
P <- transitive_reduction(P)
d <- dominance_graph(P)
## Not run: plot(d)



