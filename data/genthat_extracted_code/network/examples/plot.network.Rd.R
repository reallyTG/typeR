library(network)


### Name: plot.network.default
### Title: Two-Dimensional Visualization for Network Objects
### Aliases: plot.network plot.network.default
### Keywords: hplot graphs

### ** Examples

#Construct a sparse graph
m<-matrix(rbinom(100,1,1.5/9),10)
diag(m)<-0
g<-network(m)

#Plot the graph
plot(g)

#Load Padgett's marriage data
data(flo)
nflo<-network(flo)
#Display the network, indicating degree and flagging the Medicis
plot(nflo, vertex.cex=apply(flo,2,sum)+1, usearrows=FALSE,
    vertex.sides=3+apply(flo,2,sum),
    vertex.col=2+(network.vertex.names(nflo)=="Medici"))



