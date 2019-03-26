library(shp2graph)


### Name: nel2igraph
### Title: Produce an "igraph" object
### Aliases: nel2igraph
### Keywords: igraph

### ** Examples

data(ORN)
rtNEL<-readshpnw(ORN.nt, ELComputed=TRUE)
#Add the edge length as the weight for graph
igr<-nel2igraph(rtNEL[[2]],rtNEL[[3]],weight=rtNEL[[4]])
plot(igr, vertex.label=NA, vertex.size=2,vertex.size2=2)
#plot(ORN.nt)



