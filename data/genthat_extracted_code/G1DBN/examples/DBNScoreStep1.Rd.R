library(G1DBN)


### Name: DBNScoreStep1
### Title: First order dependence graph G(1) inference
### Aliases: DBNScoreStep1
### Keywords: graphs ts models regression robust

### ** Examples

## load G1DBN Library
library(G1DBN)

data(arth800line)
data<-as.matrix(arth800line)
id<-c(60, 141, 260, 333, 365, 424, 441, 512, 521, 578, 789, 799)
names<-c("carbohydrate/sugar transporter","ATGPX2","putative integral
membrane prot" ,
"AT3G05900", "At3g27350", "At1g16720","ATISA3/ISA3","AT4G32190",
"catalase", "plasma membrane intrinsic prot", "At4g16146", "DPE2")

## compute score S1 
out<-DBNScoreStep1(data,method='ls', targetPosition=id,predPosition=id)
round(out$S1ls,2)


## Threshold for the selection of the edges after Step 1
alpha1=0.5
## Build the edges with id as label
edgesG1id<-BuildEdges(score=out$S1ls,threshold=alpha1,
                       targetNames=id,predNames=id,prec=6)
## Build the edges with names as label
edgesG1names<-BuildEdges(score=out$S1ls,threshold=alpha1,
                         targetNames=names,predNames=names,prec=6)
edgesG1id[1:15,]
edgesG1names[1:15,]


## compute score S2 from S1 
S2<-DBNScoreStep2(out$S1ls,data,method='ls',alpha1=alpha1,
                  predPosition=id,targetPosition=id)
S2

## Threshold for the selection of the edges after Step 2
alpha2=0.05
## Build the edges with id as label
edgesG2id<-BuildEdges(score=S2,threshold=alpha2,
                      targetNames=id,predNames=id,prec=6)
## Build the edges with names as label
edgesG2names<-BuildEdges(score=S2,threshold=alpha2,
                         targetNames=names,predNames=names,prec=6)
edgesG2id
edgesG2names


## As the number of genes is reduced to 10 here, this results slightly differ
## from the results obtained in the paper (Lebre, 2009) cited in References.


## ======================================
## PLOTTING THE RESULTS...
## ______________________________________
## Not run: 
##D ## The Inferred Nets
##D ## -----------------
##D 
##D ## Nodes coordinates are calculated according to the global structure of the graph
##D all_parents=c(edgesG1id[,1], edgesG2id[,1])
##D all_targets=c(edgesG1id[,2], edgesG2id[,2])
##D posEdgesG1=1:dim(edgesG1id)[1]
##D posEdgesG2=(dim(edgesG1id)[1]+1):length(all_targets)
##D 
##D ## Global network with all the edges
##D netAll = graph.edgelist(cbind(as.character(all_parents),as.character(all_targets )))
##D 
##D ## Nodes coordinates
##D nodeCoord=layout.fruchterman.reingold(netAll)
##D 
##D 
##D split.screen(c(1,2))
##D 
##D # after Step 1
##D screen(1)
##D # set the edges list
##D netG1 = graph.edgelist(cbind(as.character(edgesG1id[,1]),as.character(edgesG1id[,2])))
##D # set the object for plotting the network with global coordinates of all nodes
##D G1toPlot=delete.edges(netAll, E(netAll)[posEdgesG2] )
##D # plot the network
##D plot(G1toPlot, layout=nodeCoord, vertex.label = 
##D get.vertex.attribute(G1toPlot , name="name"), edge.arrow.size = 0.2,
##D main="G1DBN Inferred network:\n Step 1")
##D 
##D # after Step 2
##D screen(2)
##D # set the edges list
##D 
##D netG2 = graph.edgelist(cbind(as.character(edgesG2id[,1]),as.character(edgesG2id[,2])))
##D # set the object for plotting the network with global coordinates of all nodes
##D G2toPlot=delete.edges(netAll, E(netAll)[posEdgesG1] )
##D # plot the network
##D plot(G2toPlot, layout=nodeCoord, vertex.label = 
##D get.vertex.attribute(G2toPlot , name="name"),edge.arrow.size = 0.2,
##D main="G1DBN Inferred network:\n Step 2")
##D 
##D close.screen(all = TRUE)
## End(Not run)



