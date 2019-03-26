library(network)


### Name: add.vertices
### Title: Add Vertices to an Existing Network
### Aliases: add.vertices add.vertices.network
### Keywords: classes graphs

### ** Examples

#Initialize a network object
g<-network.initialize(5)
g

#Add five more vertices
add.vertices(g,5)
g

#Create two more, with attributes
vat<-replicate(2,list(is.added=TRUE,num.added=2),simplify=FALSE)
add.vertices(g,2,vattr=vat)
g%v%"is.added"       #Values are only present for the new cases
g%v%"num.added"

#Add to a bipartite network
bip <-network.initialize(5,bipartite=3)
get.network.attribute(bip,'bipartite') # how many vertices in first mode?
add.vertices(bip,3,last.mode=FALSE)
get.network.attribute(bip,'bipartite')



