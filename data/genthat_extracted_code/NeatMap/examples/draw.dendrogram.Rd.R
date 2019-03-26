library(NeatMap)


### Name: draw.dendrogram
### Title: Draws a dendrogram in 2d
### Aliases: draw.dendrogram
### Keywords: aplot

### ** Examples

#compare complete and average linkage
mtcars.cluster<-hclust(dist(mtcars),method="complete")
mtcars.cluster.avg<-hclust(dist(mtcars),method="average")
#ggplot.default()+draw.dendrogram(mtcars.cluster,leaf.order=mtcars.cluster.avg$order)
qplot(x=0,y=0)+draw.dendrogram(mtcars.cluster,leaf.order=mtcars.cluster.avg$order)




