library(memnet)


### Name: aspl
### Title: Average shortest path length (aspl)
### Aliases: aspl

### ** Examples


# get fluency data
data(animal_fluency)

# edge lists of fluency graphs
edge_list = threshold_graph(animal_fluency)

# get adjacency matrices
adj = edg_to_adj(edge_list)

# get average shortest path length
aspl(adj)

# get corrected average shortest path length
aspl(adj, types = 'corrected')




