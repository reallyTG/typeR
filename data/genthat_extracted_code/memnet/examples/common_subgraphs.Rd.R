library(memnet)


### Name: common_subgraphs
### Title: Get common subgraph
### Aliases: common_subgraphs

### ** Examples


# get fluency data
data(animal_fluency)

# edge lists of fluency graphs
edge_list_1 = threshold_graph(animal_fluency[1:100])
edge_list_2 = threshold_graph(animal_fluency[101:200])

# get adjacency matrices
adj_1 = edg_to_adj(edge_list_1)
adj_2 = edg_to_adj(edge_list_2)

# get common subgraph
common_subgraphs(adj_1, adj_2)




