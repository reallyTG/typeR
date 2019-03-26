library(network)


### Name: get.neighborhood
### Title: Obtain the Neighborhood of a Given Vertex
### Aliases: get.neighborhood
### Keywords: graphs

### ** Examples

#Create a network with three edges
m<-matrix(0,3,3)
m[1,2]<-1; m[2,3]<-1; m[3,1]<-1
g<-network(m)

#Examine the neighborhood of vertex 1
get.neighborhood(g,1,"out")
get.neighborhood(g,1,"in")
get.neighborhood(g,1,"combined")



