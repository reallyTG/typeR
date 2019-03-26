library(networkDynamic)


### Name: add.vertices.active
### Title: add.verticies.active, add.edges.active
### Aliases: add.vertices.active add.edges.active

### ** Examples

nw <- network.initialize(5)
activate.vertices(nw,onset=0,terminus=10)
network.size(nw)  # just 5 nodes
# add some new nodes with times
add.vertices.active(nw,2,onset=10,terminus=12)
network.size(nw)  # now we have 7 nodes

# add 2 edges edges, and activate them
add.edges(nw, tail=c(1,2),head=c(2,3))
activate.edges(nw,onset=0,terminus=10,e=1:2)

# instead add and activate at the same time
add.edges.active(nw, tail=c(3,4),head=c(4,5),onset=10,terminus=12)



