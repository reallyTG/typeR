library(ReorderCluster)


### Name: colorDendClass
### Title: Makes the plot of the dendrogram, visualizing the class label
###   information with different colors of dendrogram edges.
### Aliases: colorDendClass
### Keywords: dendrogram clustering

### ** Examples

data(leukemia)
rownames(leukemia)=leukemia[,1]
leukemia=leukemia[,-1]
matr=leukemia[,-101]
class=leukemia[,101]

matr=as.matrix(matr)
dist=dist(matr)
hc <- hclust(dist)
dend=as.dendrogram(hc)

label=unique(class)

Rowcolor=rainbow(length(label))
rc=matrix(0,length(class),1)

for (j in 1:length(label))
{
		index=which(class==label[j])
		rc[index]=Rowcolor[j]
}

colorDendClass(dend,rc[hc$order])



