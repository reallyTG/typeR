library(netdiffuseR)


### Name: nvertices
### Title: Count the number of vertices/edges/slices in a graph
### Aliases: nvertices nnodes nedges nlinks nslices

### ** Examples

# Creating a dynamic graph (we will use this for all the classes) -----------
set.seed(13133)
diffnet <- rdiffnet(100, 4)

# Lets use the first time period as a static graph
graph_mat <- diffnet$graph[[1]]
graph_dgCMatrix <- methods::as(graph_mat, "dgCMatrix")

# Now lets generate the other dynamic graphs
graph_list  <- diffnet$graph
graph_array <- as.array(diffnet) # using the as.array method for diffnet objects

# Now we can compare vertices counts
nvertices(diffnet)
nvertices(graph_list)
nvertices(graph_array)

nvertices(graph_mat)
nvertices(graph_dgCMatrix)

# ... and edges count
nedges(diffnet)
nedges(graph_list)
nedges(graph_array)

nedges(graph_mat)
nedges(graph_dgCMatrix)



