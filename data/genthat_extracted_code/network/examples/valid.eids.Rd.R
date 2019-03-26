library(network)


### Name: valid.eids
### Title: Get the ids of all the edges that are valid in a network
### Aliases: valid.eids

### ** Examples

net<-network.initialize(100)
add.edges(net,1:99,2:100)
delete.edges(net,eid=5:95)
# get the ids of the non-deleted edges
valid.eids(net)



