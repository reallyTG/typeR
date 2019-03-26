library(network)


### Name: edgeset.constructors
### Title: Edgeset Constructors for Network Objects
### Aliases: edgeset.constructors network.adjacency network.incidence
###   network.edgelist network.bipartite
### Keywords: classes graphs

### ** Examples

#Create an arbitrary adjacency matrix
m<-matrix(rbinom(25,1,0.5),5,5)
diag(m)<-0

g<-network.initialize(5)    #Initialize the network
network.adjacency(m,g)      #Import the edge data

#Do the same thing, using replacement operators
g<-network.initialize(5)
g[,]<-m

# load edges from a data.frame via network.edgelist
edata <-data.frame(
  tails=c(1,2,3),
  heads=c(2,3,1),
  love=c('yes','no','maybe'),
  hate=c(3,-5,2),
  stringsAsFactors=FALSE
  )

g<-network.edgelist(edata,network.initialize(4),ignore.eval=FALSE)
as.sociomatrix(g,attrname='hate')
g%e%'love'

# load edges from an incidence matrix
inci<-matrix(c(1,1,0,0, 0,1,1,0, 1,0,1,0),ncol=3,byrow=FALSE)
inci
g<-network.incidence(inci,network.initialize(4,directed=FALSE))
as.matrix(g)

# load in biparite dataframe with weights
bipMat<-data.frame(
        event1=c(1,2,1,0),
        event2=c(0,0,3,0),
        event3=c(1,1,0,4),
        row.names=c("a","b","c","d"))
net<-network(bipMat,matrix.type='bipartite',ignore.eval=FALSE,names.eval='pies')
as.matrix(net,attername='pies')




