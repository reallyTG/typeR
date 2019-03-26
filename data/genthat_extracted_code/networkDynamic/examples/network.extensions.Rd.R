library(networkDynamic)


### Name: network.extensions
### Title: Dynamically Extended Core Network Functions
### Aliases: network.extensions get.edgeIDs.active get.edges.active
###   get.neighborhood.active is.adjacent.active network.dyadcount.active
###   network.edgecount.active network.naedgecount.active
###   network.size.active
### Keywords: ~kwd1 ~kwd2

### ** Examples


## is.adjacent.active
triangle <- network.initialize(3)    # create a toy network
add.edge(triangle,1,2)               # add an edge between vertices 1 and 2
add.edge(triangle,2,3)               # add a more edges
add.edge(triangle,3,1)
is.adjacent.active(triangle,vi=1,vj=2,onset=2,length=1)

## get.edges.active
net <-network.initialize(5)
net[1,2]<-1;
net[2,3]<-1;
activate.edges(net,onset=1,terminus=Inf,e=1)
activate.edges(net,onset=2,terminus=3,e=2)
get.edges.active(net,v=2,at=1)
get.edges.active(net,v=2,at=1, neighborhood="combined")
get.edges.active(net,v=2,at=2, neighborhood="combined")

## get the ids of the active edges instead (could be multiple incident edges)
get.edgeIDs.active(net,v=2,at=2)

## or get ids of the active nodes in a vertex neighborhood
get.neighborhood.active(net,v=2,at=2)

# returns both edges
get.edges.active(net,v=2,onset=1, terminus=3, neighborhood="combined", rule='any')
# returns only one edge (e=2)
get.edges.active(net,v=2,onset=1, terminus=3, neighborhood="combined", rule='all')

## network.edgecount.active
network.edgecount.active(net, at=1, active.default=FALSE)
network.edgecount.active(net, at=2, active.default=FALSE)
network.edgecount.active(net, at=5, active.default=FALSE)




