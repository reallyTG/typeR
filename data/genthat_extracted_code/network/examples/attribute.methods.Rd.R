library(network)


### Name: attribute.methods
### Title: Attribute Interface Methods for the Network Class
### Aliases: attribute.methods delete.edge.attribute
###   delete.network.attribute delete.vertex.attribute get.edge.attribute
###   get.edge.value get.network.attribute get.vertex.attribute
###   list.edge.attributes list.network.attributes list.vertex.attributes
###   network.vertex.names network.vertex.names<- set.edge.attribute
###   set.edge.value set.network.attribute set.vertex.attribute
### Keywords: classes graphs

### ** Examples

#Create a network with three edges
m<-matrix(0,3,3)
m[1,2]<-1; m[2,3]<-1; m[3,1]<-1
g<-network(m)

#Create a matrix of values corresponding to edges
mm<-m
mm[1,2]<-7; mm[2,3]<-4; mm[3,1]<-2

#Assign some attributes
set.edge.attribute(g,"myeval",3:5)
set.edge.value(g,"myeval2",mm)
set.network.attribute(g,"mygval","boo")
set.vertex.attribute(g,"myvval",letters[1:3])
network.vertex.names(g) <- LETTERS[1:10]

#List the attributes
list.edge.attributes(g)
list.network.attributes(g)
list.vertex.attributes(g)

#Retrieve the attributes
get.edge.attribute(g$mel,"myeval")  #Note the first argument!
get.edge.value(g,"myeval")          #Another way to do this
get.edge.attribute(g$mel,"myeval2") 
get.network.attribute(g,"mygval")
get.vertex.attribute(g,"myvval")
network.vertex.names(g)

#Purge the attributes
delete.edge.attribute(g,"myeval")
delete.edge.attribute(g,"myeval2")
delete.network.attribute(g,"mygval")
delete.vertex.attribute(g,"myvval")

#Verify that the attributes are gone
list.edge.attributes(g)
list.network.attributes(g)
list.vertex.attributes(g)

#Note that we can do similar things using operators
g %n% "mygval" <- "boo"               #Set attributes, as above
g %v% "myvval" <- letters[1:3]
g %e% "myeval" <- mm
g[,,names.eval="myeval"] <- mm          #Another way to do this
g %n% "mygval"                        #Retrieve the attributes
g %v% "myvval"
g %e% "mevval"
as.sociomatrix(g,"myeval")              # Or like this




