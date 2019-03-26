library(RAM)


### Name: network_data
### Title: Creates Nodes and Edge-List For An OTU Table
### Aliases: network_data
### Keywords: models

### ** Examples

data(ITS1, meta)
## Not run: 
##D ITS1.01<-filter.OTU(data=list(ITS1=ITS1), percent=0.01)[[1]]
##D 
##D # create nodes and edges lists
##D b<-network_data(ITS1.01, is.OTU=TRUE, meta)
##D b_node<-b[[1]]
##D b_edge<-b[[2]]
##D head(b_node)
##D head(b_edge)
##D 
##D library(igraph)
##D b1<-graph.data.frame(b_edge, directed=FALSE)
##D lev <- levels(factor(E(b1)$Crop))
##D 
##D # vertices size
##D V(b1)$size<-degree(b1)
##D 
##D # vertices color
##D Crop1<-rownames(meta)[meta$Crop=="Crop1"]
##D Crop2<-rownames(meta)[meta$Crop=="Crop2"]
##D 
##D ## vertices representing samples from crop1 will be in red,
##D ## vertices representing samples from crop2 will be in blue;
##D ## vertices representing taxa will be in pink
##D V(b1)$color[which(is.element(V(b1)$name, Crop1))]<-"red"
##D V(b1)$color[which(is.element(V(b1)$name, Crop2))]<-"blue"
##D V(b1)$color[-which(is.element(V(b1)$name, c(Crop1, Crop2)))]<-"pink"
##D V(b1)$color
##D 
##D # edges color
##D col<-c("red", "blue")
##D for (i in 1:length(lev) ) { 
##D   E(b1)$color[E(b1)$Crop==lev[i]] <- col[i]
##D }
##D 
##D # plot
##D plot(b1, vertex.label.font=2,
##D          vertex.label.cex=0.5,
##D          layout=layout.kamada.kawai)
## End(Not run)



