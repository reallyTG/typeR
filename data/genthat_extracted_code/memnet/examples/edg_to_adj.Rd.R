library(memnet)


### Name: edg_to_adj
### Title: Edge list to adjacency matrix
### Aliases: edg_to_adj

### ** Examples


# get fluency data
data(animal_fluency)

# edge list of fluency graph
edge_list = threshold_graph(animal_fluency[1:3])

# transfrom to adjacency matrix
edg_to_adj(edge_list)




