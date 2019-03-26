library(networkDynamic)


### Name: network.collapse
### Title: Convert a time range of a networkDynamic object into a static
###   network object.
### Aliases: network.collapse %k%

### ** Examples

# create a network with some basic activity
test<-network.initialize(5)
add.edges.active(test, tail=c(1,2,3), head=c(2,3,4),onset=0,terminus=1)
activate.edges(test,onset=3,terminus=5)
activate.edges(test,onset=-2,terminus=-1)

# collapse the whole thing
net <-network.collapse(test)
is.networkDynamic(net)
get.vertex.attribute(net,'activity.duration')
get.edge.value(net,'activity.count')
get.edge.value(net,'activity.duration')

# add a dynamic edge attribute
activate.edge.attribute(test,'weight',5,onset=3,terminus=4)
activate.edge.attribute(test,'weight',3,onset=4,terminus=5)

# collapse with an interval query
net3<-network.collapse(test,onset=3,terminus=4)
get.edge.value(net3,'weight')

# note that if we use a query that intersects mutiple 
# attribute values it will generate a warning. 
# try commented line below:

# net3<-network.collapse(test,onset=3,terminus=5)

# but should be safe from attribute issues when
# collapsing with a point query
net3<-network.collapse(test,at=3)
get.edge.value(net3,'weight')

# can use operator version for point query instead
net3<-test%k%4.5
get.edge.value(net3,'weight')






