library(NeatMap)


### Name: draw.dendrogram3d
### Title: Draws a dendrogram in 3d
### Aliases: draw.dendrogram3d
### Keywords: hplot

### ** Examples

mtcars.nMDS<-nMDS(mtcars,metric="euclidean")
mtcars.cluster<-hclust(dist(mtcars),method="complete")
draw.dendrogram3d(mtcars.cluster,mtcars.nMDS$x,labels=rownames(mtcars),label.size=0.5)



