library(NetSwan)


### Name: swan_closeness
### Title: Impact on closeness when a node is removed
### Aliases: swan_closeness

### ** Examples

library(igraph)
library(NetSwan)
elec <- matrix(nc=2, byrow=TRUE, c(11,1, 11,10, 1,2, 2,3, 2,9, 
3,4, 3,8, 4,5, 5,6, 5,7, 6,7, 7,8, 8,9, 9,10))
gra<-graph.edgelist(elec, directed=FALSE)

f2<-swan_closeness(gra)
bet<-betweenness(gra)
reg<-lm(bet~f2)
summary(reg)




