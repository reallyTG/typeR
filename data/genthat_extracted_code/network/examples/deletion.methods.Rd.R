library(network)


### Name: deletion.methods
### Title: Remove Elements from a Network Object
### Aliases: deletion.methods delete.edges delete.vertices
### Keywords: classes graphs

### ** Examples

#Create a network with three edges
m<-matrix(0,3,3)
m[1,2]<-1; m[2,3]<-1; m[3,1]<-1
g<-network(m)

as.matrix.network(g)
delete.edges(g,2)              #Remove an edge
as.matrix.network(g)
delete.vertices(g,2)           #Remove a vertex
as.matrix.network(g)

#Can also remove edges using extraction/replacement operators
g<-network(m)
g[1,2]<-0                      #Remove an edge
g[,]
g[,]<-0                        #Remove all edges
g[,]



