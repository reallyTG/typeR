library(networkDynamic)


### Name: add.methods
### Title: PID-aware versions of functions for adding edges and vertices to
###   networkDynamic objects
### Aliases: add.edges.networkDynamic add.vertices.networkDynamic
###   add.edge.networkDynamic

### ** Examples

# add vertices while using vertex.names as pids
nd <- as.networkDynamic(network.initialize(3))
set.network.attribute(nd,"vertex.pid","vertex.names")
add.vertices(nd,nv=2,vertex.pid=c(4,5)) # specify pids for two new vertices
network.vertex.names(nd) # peek at pids

# add vertices and edges w/ auto-generated pids
nd <- as.networkDynamic(network.initialize(3))
initialize.pids(nd)
get.vertex.attribute(nd,'vertex.pid') # peek at pids
add.vertices(nd,nv=2) # silently generate pids for vertices
get.vertex.attribute(nd,'vertex.pid') # peek at pids
add.edges(nd,1,2) # silently generate a pid for the edge
get.edge.attribute(nd,'edge.pid')




