library(DendSer)


### Name: DendSer
### Title: Implements dendrogram seriation
### Aliases: DendSer

### ** Examples

	 			
require(DendSer) 			

d<- dist(iris[,-5])
h <- hclust(d,method="average")
ob<- DendSer(h,d)
opl<- DendSer(h,d,cost=costPL)
plotAsColor(d,ob)

w <- rowSums(iris[,-5])
ow <- DendSer(h,w,cost=costLS) # arranges cases by size, within hclust
stars(iris[ow,-5],labels=NULL, col.stars=cutree(h,3)[ow]) # and color by cluster
#stars(iris[ow,-5],labels=NULL, col.stars=iris[ow,5]) # or by species





