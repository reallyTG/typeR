library(network)


### Name: add.edges
### Title: Add Edges to a Network Object
### Aliases: add.edges add.edge add.edges.network add.edge.network
### Keywords: classes graphs

### ** Examples

#Initialize a small, empty network
g<-network.initialize(3)

#Add an edge
add.edge(g,1,2)
g

#Can also add edges using the extraction/replacement operators
#note that replacement operators are much slower than add.edges()
g[,3]<-1
g[,]

#Add multiple edges with attributes to a network

# pretend we just loaded in this data.frame from a file
# Note: network.edgelist() may be simpler for this case
elData<-data.frame(
  from_id=c("1","2","3","1","3","1","2"),
  to_id=c("1", "1", "1", "2", "2", "3", "3"),
  myEdgeWeight=c(1, 2, 1, 2, 5, 3, 9.5),
  someLetters=c("B", "W", "L", "Z", "P", "Q", "E"),
  edgeCols=c("red","green","blue","orange","pink","brown","gray"),
  stringsAsFactors=FALSE
)

valueNet<-network.initialize(3,loops=TRUE)

add.edges(valueNet,elData[,1],elData[,2],
    names.eval=rep(list(list("myEdgeWeight","someLetters","edgeCols")),nrow(elData)), 
    vals.eval=lapply(1:nrow(elData),function(r){as.list(elData[r,3:5])}))

list.edge.attributes(valueNet)




