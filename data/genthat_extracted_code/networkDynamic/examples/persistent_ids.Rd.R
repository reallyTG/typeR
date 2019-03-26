library(networkDynamic)


### Name: persistent.ids
### Title: Use and manipulate persistent ids of network elements
### Aliases: persistent.ids vertex.pid.check edge.pid.check get.vertex.id
###   get.vertex.pid get.edge.id get.edge.pid initialize.pids

### ** Examples


# use vertex.names as a persistent id
net<-network.initialize(5)
set.network.attribute(net, 'vertex.pid','vertex.names')

# find original vertex corresponding to vertex in smaller extracted net
haystack<-network.initialize(30)
activate.vertices(haystack,v=10:20)

# hide a needle somewhere in the haystack
set.vertex.attribute(haystack,'needle',TRUE,v=sample(1:30,1))

# set up the persistand ids with defaults
initialize.pids(haystack)

# some hay is removed over time ...
newstack<-network.extract(haystack,at=100,active.default=FALSE)
network.size(newstack)
# we find the needle!
needleId <-which(get.vertex.attribute(newstack,'needle'))
needleId

# which vertex is the corresponding one in original stack?
oldId<-get.vertex.id(haystack,get.vertex.pid(newstack,needleId))
oldId

# check if we got it right..
get.vertex.attribute(haystack,'needle')[oldId]


# one reason you wouldn't want to use ordinary vertex.names
net<-network.initialize(3)
add.vertices(net,3)
network.vertex.names(net)

# but if you make it a persistant id, new names will be created
net<-network.initialize(3)
set.network.attribute(net,'vertex.pid','vertex.names')
add.vertices(net,3)
network.vertex.names(net)

# try with edges and add/remove vertices
net <-network.initialize(10)
add.edges(net,1:9,2:10)
set.edge.attribute(net,'test',"you found me!",e=7)
initialize.pids(net)
changed<-net
add.vertices(changed,5)
delete.vertices(changed,c(1,3,5,15))
delete.edges(changed,eid=1:3)

# which edge in changed corresponds to edge 7 in net?
network.edgecount(changed)
get.edge.id(changed,get.edge.pid(net,7))
# actually, they are the same because of NULL edges in edgelist
get.edge.attribute(changed,'test',unlist=FALSE)[[7]]
# however, the ids of the vertices have changed
changed$mel[[7]]$inl
net$mel[[7]]$inl

# do they still match up?
get.vertex.pid(changed,changed$mel[[7]]$inl)==get.vertex.pid(net,net$mel[[7]]$inl)





