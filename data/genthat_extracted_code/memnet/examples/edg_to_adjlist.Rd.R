library(memnet)


### Name: edg_to_adjlist
### Title: Edge list to adjlist
### Aliases: edg_to_adjlist

### ** Examples


# get fluency data
data(animal_fluency)

# edge list of fluency graph
edge_list = threshold_graph(animal_fluency[1:3])

# transfrom to adjacency matrix
edg_to_adjlist(edge_list)




