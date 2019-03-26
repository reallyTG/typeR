library(qgraph)


### Name: qgraph.layout.fruchtermanreingold
### Title: qgraph.layout.fruchtermanreingold
### Aliases: qgraph.layout.fruchtermanreingold

### ** Examples

## Not run: 
##D # This example makes a multipage PDF that contains images
##D # Of a building network using soft constraints.
##D 
##D # Each step one node is added with one edge. The max.delta
##D # decreases the longer nodes are present in the network.
##D 
##D pdf("Soft Constraints.pdf",width=10,height=5)
##D 
##D adj=adjO=matrix(0,nrow=3,ncol=3)
##D adj[upper.tri(adj)]=1
##D Q=qgraph(adj,vsize=3,height=5,width=10,layout="spring",
##D 	esize=1,filetype='',directed=T)
##D cons=Q$layout
##D for (i in 1:20)
##D {
##D 	x=nrow(adj)
##D 	adjN=matrix(0,nrow=x+1,ncol=x+1)
##D 	adjN[1:x,1:x]=adj
##D 	consN=matrix(NA,nrow=x+1,ncol=2)
##D 	consN[1:x,]=cons[1:x,]
##D 	layout.par=list(init=rbind(cons,c(0,0)),
##D 	max.delta=10/(x+1):1,area=10^2,repulse.rad=10^3)
##D 	y=sample(c(x,sample(1:(x),1)),1)
##D 	adjN[y,x+1]=1
##D 	Q=qgraph(adjN,Q,layout="spring",layout.par=layout.par)
##D 	cons=Q$layout
##D 	adj=adjN
##D } 
##D dev.off()
## End(Not run)



