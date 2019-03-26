library(networkDynamic)


### Name: reconcile.activity
### Title: Modify the activity spells of vertices to match incident edges
###   or the other way around
### Aliases: reconcile.vertex.activity reconcile.edge.activity
###   reconcile.activity

### ** Examples

nd<-network.initialize(6)
add.edges.active(nd,tail=1:3,head=2:4,onset=1,terminus=3)
add.edges.active(nd,tail=4,head=1,onset=5,terminus=7)
add.edge(nd,tail=1,head=6)
# before
get.vertex.activity(nd,as.spellList=TRUE)
reconcile.vertex.activity(nd)
# after
get.vertex.activity(nd,as.spellList=TRUE)

# induce edge activity for known vertex timing
nd<-network.initialize(4,directed=FALSE)
activate.vertices(nd,onset=1:4,terminus=3:6)
nd[,]<-1
get.edge.activity(nd,as.spellList=TRUE)
reconcile.edge.activity(nd, mode="reduce.to.vertices")
get.edge.activity(nd,as.spellList=TRUE)




