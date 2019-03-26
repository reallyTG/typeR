library(memnet)


### Name: l_comp
### Title: Retrieve largest component
### Aliases: l_comp

### ** Examples


# get fluency data
data(animal_fluency)

# edge list of fluency graph
edge_list = threshold_graph(animal_fluency[1:10])

# get adjacency matrix
adj = edg_to_adj(edge_list)

# get largest component
l_comp(adj)




