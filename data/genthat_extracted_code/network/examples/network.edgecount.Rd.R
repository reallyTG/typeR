library(network)


### Name: network.edgecount
### Title: Return the Number of Edges in a Network Object
### Aliases: network.edgecount
### Keywords: classes graphs

### ** Examples

#Create a network with three edges
m<-matrix(0,3,3)
m[1,2]<-1; m[2,3]<-1; m[3,1]<-1
g<-network(m)
network.edgecount(g)==3   #Verify the edgecount



