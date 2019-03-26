library(clusterGenomics)


### Name: plotHeatmap
### Title: Plot a heatmap
### Aliases: plotHeatmap

### ** Examples

## Create a data matrix
A = cbind(matrix(rnorm(70*20),nrow=70), matrix(3+rnorm(70*20),nrow=70))
B = cbind(-1 + matrix(rnorm(40*30),nrow=40), matrix(1+rnorm(40*10),nrow=40))
X = rbind(A,B)[sample(110), sample(40)]

## Cluster rows and columns
rowclust = hclust(dist(X, method="euclidean"), method="complete")
colclust = hclust(dist(t(X), method="euclidean"), method="average")

## Plot data in original order and in clustered order
par(mfrow=c(1,2))
plotHeatmap(X, c(0,0))
plotHeatmap(X[rowclust$order, colclust$order])
plotTreeRow(rowclust)
plotTreeCol(colclust)

## Identify groups with PART and color the leaves of the dendrogram accordingly
rowgroups = part(X, B=10, linkage="complete")$lab.hatK
colgroups = part(t(X), B=10)$lab.hatK
plotHeatmap(X[rowclust$order, colclust$order])
plotTreeRow(rowclust, rowgroups[rowclust$order])
plotTreeCol(colclust, colgroups[colclust$order])




