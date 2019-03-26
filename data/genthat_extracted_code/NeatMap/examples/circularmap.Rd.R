library(NeatMap)


### Name: circularmap
### Title: Heatmap arranged as an annular region
### Aliases: circularmap make.circularmap
### Keywords: hplot

### ** Examples

make.circularmap(as.matrix(mtcars),metric="euclidean",cluster.method="complete.linkage",
normalize.profiles=FALSE)

#is equivalent to
mtcars.nMDS<-nMDS(as.matrix(mtcars),metric="euclidean")
mtcars.cluster<-hclust(dist(mtcars),method="complete")
circularmap(mtcars.nMDS$x,as.matrix(mtcars),normalize.profiles=FALSE,
cluster.result=mtcars.cluster)

#To change coloring scheme etc
make.circularmap(as.matrix(mtcars),metric="euclidean",cluster.method="complete.linkage",
normalize.profiles=FALSE)+scale_colour_gradient2(low="yellow",high="blue",
mid="black",midpoint=200);



