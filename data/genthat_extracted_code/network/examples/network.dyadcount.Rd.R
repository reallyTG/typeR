library(network)


### Name: network.dyadcount
### Title: Return the Number of (Possibly Directed) Dyads in a Network
###   Object
### Aliases: network.dyadcount
### Keywords: classes graphs

### ** Examples

#Create a directed network with three edges
m<-matrix(0,3,3)
m[1,2]<-1; m[2,3]<-1; m[3,1]<-1
g<-network(m)
network.dyadcount(g)==6                 #Verify the directed dyad count
g<-network(m|t(m),directed=FALSE)
network.dyadcount(g)==3                         #nC2 in undirected case



