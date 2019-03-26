library(NetSwan)


### Name: swan_combinatory
### Title: Error and attack tolerance of complex networks
### Aliases: swan_combinatory

### ** Examples

library(igraph)
library(NetSwan)
elec <- matrix(nc=2, byrow=TRUE, c(11,1, 11,10, 1,2, 2,3, 2,9, 
3,4, 3,8, 4,5, 5,6, 5,7, 6,7, 7,8, 8,9, 9,10))
gra<-graph.edgelist(elec, directed=FALSE)

f4<-swan_combinatory(gra,10)
plot(f4[,1],f4[,5], type='o', col='yellow',xlab="Fraction of nodes removed",
       ylab="Connectivity loss")
lines(f4[,1],f4[,3], type='o', col='red')
lines(f4[,1],f4[,4], type='o', col='orange')
lines(f4[,1],f4[,2], type='o', col='blue')
legend('bottomright',c("Random", "Betweenness", "Degree", "Cascading"), 
           lty=c(1,1,1,1), pch=c(1,1,1,1), 
           col=c("yellow","blue","red", "orange"))



