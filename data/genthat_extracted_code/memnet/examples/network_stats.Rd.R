library(memnet)


### Name: network_stats
### Title: Network statistics
### Aliases: network_stats

### ** Examples


# get fluency data
data(animal_fluency)

# edge lists of fluency graphs
edge_list = threshold_graph(animal_fluency)

# get adjacency matrices
adj = edg_to_adj(edge_list)

# get structural overview
network_stats(adj)




