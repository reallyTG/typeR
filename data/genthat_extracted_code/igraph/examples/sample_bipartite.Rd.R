library(igraph)


### Name: sample_bipartite
### Title: Bipartite random graphs
### Aliases: sample_bipartite bipartite.random.game bipartite
### Keywords: graphs

### ** Examples


## empty graph
sample_bipartite(10, 5, p=0)

## full graph
sample_bipartite(10, 5, p=1)

## random bipartite graph
sample_bipartite(10, 5, p=.1)

## directed bipartite graph, G(n,m)
sample_bipartite(10, 5, type="Gnm", m=20, directed=TRUE, mode="all")




