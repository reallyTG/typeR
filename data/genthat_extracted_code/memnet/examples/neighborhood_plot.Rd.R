library(memnet)


### Name: neighborhood_plot
### Title: Neighborhood plot
### Aliases: neighborhood_plot

### ** Examples


## Not run: 
##D # get fluency data
##D data(animal_fluency)
##D 
##D # edge list of fluency graph
##D edge_list = threshold_graph(animal_fluency[1:40])
##D 
##D # get adjacency matrix
##D adj = edg_to_adj(edge_list)
##D 
##D # plot
##D neighborhood_plot(adj, node = 'dog', k = 2)
## End(Not run)




