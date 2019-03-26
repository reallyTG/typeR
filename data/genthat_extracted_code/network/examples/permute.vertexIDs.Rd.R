library(network)


### Name: permute.vertexIDs
### Title: Permute (Relabel) the Vertices Within a Network
### Aliases: permute.vertexIDs
### Keywords: manip graphs

### ** Examples

data(flo)                     #Load the Florentine Families data
nflo<-network(flo)                      #Create a network object
n<-network.size(nflo)                #Get the number of vertices
permute.vertexIDs(nflo,n:1)                #Reverse the vertices
all(flo[n:1,n:1]==as.sociomatrix(nflo))          #Should be TRUE



