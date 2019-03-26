library(network)


### Name: get.edges
### Title: Retrieve Edges or Edge IDs Associated with a Given Vertex
### Aliases: get.edges get.edgeIDs get.dyads.eids
### Keywords: classes graphs

### ** Examples

#Create a network with three edges
m<-matrix(0,3,3)
m[1,2]<-1; m[2,3]<-1; m[3,1]<-1
g<-network(m)

get.edges(g,1,neighborhood="out")
get.edgeIDs(g,1,neighborhood="in")



