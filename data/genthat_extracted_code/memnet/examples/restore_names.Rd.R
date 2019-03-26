library(memnet)


### Name: restore_names
### Title: Restore names of memnet objects
### Aliases: restore_names

### ** Examples


# get fluency data
data(animal_fluency)

# edge list of fluency graph
edge_list = threshold_graph(animal_fluency)

# extract adjlist from community network
adjlist = edg_to_adjlist(edge_list)

f = fluency(adjlist, c(10, 14, 16, 18))
restore_names(f, get_names(edge_list))




