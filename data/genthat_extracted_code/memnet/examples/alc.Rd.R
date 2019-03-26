library(memnet)


### Name: alc
### Title: Average local clustering (alc) coefficient
### Aliases: alc

### ** Examples


# get fluency data
data(animal_fluency)

# edge lists of fluency graphs
edge_list = threshold_graph(animal_fluency)

# get adjacency matrices
adj = edg_to_adj(edge_list)

# get local average clustering coefficient
alc(adj)

# get corrected local average clustering coefficient
alc(adj, types = 'corrected')




