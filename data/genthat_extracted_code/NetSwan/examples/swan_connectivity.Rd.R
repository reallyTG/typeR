library(NetSwan)


### Name: swan_connectivity
### Title: Impact on connectivity when a node is removed
### Aliases: swan_connectivity

### ** Examples

library(igraph)
library(NetSwan)
elec <- matrix(nc=2, byrow=TRUE, c(11,1, 11,10, 1,2, 2,3, 2,9, 
3,4, 3,8, 4,5, 5,6, 5,7, 6,7, 7,8, 8,9, 9,10))
gra<-graph.edgelist(elec, directed=FALSE)

f3<-swan_connectivity(gra)



