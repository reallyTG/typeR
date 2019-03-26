library(networkDynamic)


### Name: attribute.activity.functions
### Title: Functions to activate and query dynamic attributes on vertices,
###   edges, and networks
### Aliases: attribute.activity.functions activate.vertex.attribute
###   get.vertex.attribute.active activate.edge.attribute
###   activate.edge.value get.edge.value.active get.edge.attribute.active
###   activate.network.attribute get.network.attribute.active
###   deactivate.edge.attribute deactivate.vertex.attribute
###   deactivate.network.attribute list.vertex.attributes.active
###   list.edge.attributes.active list.network.attributes.active TEAs
###   dynamic.attributes

### ** Examples

#initialize network
test<-network.initialize(5)

#activate vertex attribute
test<-activate.vertex.attribute(test,"letter","a",onset=0,terminus=1)
test<-activate.vertex.attribute(test,"number","4",onset=1,terminus=2)
test<-activate.vertex.attribute(test,"number","5",onset=2,terminus=3)

#list active/all vertex attributes
list.vertex.attributes.active(test, onset=0,terminus=3,dynamic.only=TRUE)
list.vertex.attributes.active(test, onset=1,terminus=3,dynamic.only=FALSE)

#get values for specific vertex attribute
get.vertex.attribute.active(test,"letter",onset=2,terminus=3)

#deactive vertex attribute
test <- deactivate.vertex.attribute(test, "letter", onset=0, terminus=3)
list.vertex.attributes.active(test, onset=0,terminus=3,dynamic.only=TRUE)

#initialize edges
test[1,2]<-1
test[2,3]<-1

#activate edge attribute
test<-activate.edge.attribute(test,"number",1,onset=0,terminus=2)
test<-activate.edge.attribute(test,"number",5,onset=2,terminus=5)
test<-activate.edge.attribute(test,"letter","a",onset=1,terminus=4)

#list edge attributes
list.edge.attributes.active(test, onset=0,terminus=4,dynamic.only=TRUE)
list.edge.attributes.active(test, onset=0,terminus=4,dynamic.only=FALSE)

#get values for specific edge attribute
get.edge.value.active(test,"number",onset=3,terminus=4)

#deactive edge attribute
test <- deactivate.edge.attribute(test, "letter", onset=0, terminus=3)
list.edge.attributes.active(test, onset=0,terminus=3,dynamic.only=TRUE)

#activate network attribute
test <- activate.network.attribute(test,"alist",list("a","b"),onset=1,terminus=2)
test <- activate.network.attribute(test,"alist",list("c","d"),onset=2,terminus=3)
test <- activate.network.attribute(test,"aspace",list("1","2"),onset=1,terminus=2)
test <- activate.network.attribute(test,"aspace",list("3","4"),onset=2,terminus=3)

#list network attributes
list.network.attributes.active(test, onset=0,terminus=3,dynamic.only=TRUE)
list.network.attributes.active(test, onset=0,terminus=3,dynamic.only=FALSE)

#get values for specific network attribute
get.network.attribute.active(test,"alist",at=2.5,unlist=FALSE)

#deactive network attribute
test <- deactivate.network.attribute(test, "alist", onset=0, terminus=3)
list.network.attributes.active(test, onset=0,terminus=3,dynamic.only=TRUE)

# activate multiple values on multiple vertices at multiple times
test<-network.initialize(3)
activate.vertex.attribute(test,"letters",c("a","b","c"),onset=c(0,1,2),terminus=c(1,2,3))

# peek at TEA structure using non-TEA attribute query
get.vertex.attribute(test,"letters.active",unlist=FALSE)

# compare different 'rules'
test<-network.initialize(1)
activate.vertex.attribute(test,'color','red',onset=0,terminus=1)
activate.vertex.attribute(test,'color','green',onset=1,terminus=2)
activate.vertex.attribute(test,'color','blue',onset=2,terminus=3)

get.vertex.attribute.active(test,'color',onset=0,terminus=3)
get.vertex.attribute.active(test,'color',onset=0,terminus=3,return.tea=TRUE)
get.vertex.attribute.active(test,'color',onset=0,terminus=3,rule='earliest')
get.vertex.attribute.active(test,'color',onset=0,terminus=3,rule='latest')




