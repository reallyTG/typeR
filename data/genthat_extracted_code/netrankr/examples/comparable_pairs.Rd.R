library(netrankr)


### Name: comparable_pairs
### Title: Comparable pairs in a partial ranking
### Aliases: comparable_pairs

### ** Examples

library(igraph)
g <- sample_gnp(100,0.1)
P <- neighborhood_inclusion(g)
comparable_pairs(P)
# All pairs of vertices are comparable in a threshold graph
tg <- threshold_graph(100,0.3)
P <- neighborhood_inclusion(g)
comparable_pairs(P)



