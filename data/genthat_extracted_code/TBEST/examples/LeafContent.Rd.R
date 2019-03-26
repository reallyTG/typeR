library(TBEST)


### Name: LeafContent
### Title: Find names of leaves belongigng to given branches of a
###   hierarchical tree
### Aliases: LeafContent

### ** Examples

data(leukemia)
hc<-hclust(dist(data.matrix(leukemia)),"ward")
#find the name of leaf 29
LeafContent(hc,mynode=c(-29))
#find the name of leaf 29 and leaves belonging to node 29
LeafContent(hc,mynode=c(-29,29))
## Not run: 
##D mytable<-SigTree(data.matrix(leukemia),mystat="fldc",
##D         mymethod="ward",mymetric="euclidean",rand.fun="shuffle.column",
##D         distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="ML")
##D LeafContent(mytable,mynode=c(-29,29))
##D mypartition<-PartitionTree(x=mytable,siglevel=0.001,statname="fldc",sigtype="raw")
##D LeafContent(mypartition)
## End(Not run)



