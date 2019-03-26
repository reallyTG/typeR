library(clusterGenomics)


### Name: part
### Title: Partitioning Algorithm based on Recursive Thresholding
### Aliases: part

### ** Examples


## Example 1 ##
#Load a simulated data set with 5 clusters
data(exData1)
X = exData1$X
groups1 = exData1$groups

#Run PART (limit the number of reference data sets to decrease computing time):
res <- part(X, B=10)

#Compare predicted groups to true groups in the data set:
cbind(res$lab.hatK, groups1)

## Visualize results ##
#Transpose the data matrix such that samples are shown in columns:
tX <- t(X) 
#Cluster rows and columns using the same clustering method as applied in PART:
rowclust = hclust(dist(tX,method="euclidean"),method="average")
colclust = hclust(dist(t(tX), method="euclidean"),method="average")
#Order data matrix according to order in clustering og plot heatmap:
X2 = tX[rowclust$order, colclust$order]
par(mar=c(0,0,0,0))
plotHeatmap(X2)
#Add column-dendrogram with leaves colored according to the clusters found by PART: 
plotTreeCol(clust=colclust,groups=res$lab.hatK[colclust$order])
#Add color-bar to indicate the true clusters in the data set:
plotColorbarCol(groups=groups1[colclust$order]) 


## Example 2 ##
# Load a simulated data set with 4 clusters:
data(exData2)
Y = exData2$Y
groups2 = exData2$groups

# Run PART with default clustering method:
res2 = part(Y, B=10)

# Compare predicted groups to true groups in the data set:
cbind(res2$lab.hatK, groups2)

# Visualize results
# Cluster rows and columns using the same clustering method as applied in PART:
rowclust = hclust(dist(Y,method="euclidean"),method="average")
colclust = hclust(dist(t(Y), method="euclidean"),method="average")
# Order data matrix according to order in clustering og plot heatmap:
Y2 = Y[rowclust$order, colclust$order]
par(mar=c(0,0,0,0))
heat = plotHeatmap(Y2)
# Add row-dendrogram with leaves colored according to the clusters found by PART: 
plotTreeRow(clust=rowclust,groups=res2$lab.hatK[rowclust$order])
# Add column-dendrogram:
plotTreeCol(clust=colclust)
#Add color-bar to show the true group memberships:
plotColorbarRow(groups=groups2[rowclust$order]) 


## Some examples showing how to change clustering method and distance measure ##

#Run PART with complete linkage:
res3 <- part(Y, B=10, linkage="complete")

#Run PART with 1 - Pearson correlation distance
res4 <- part(Y, B=10, dist.method="cor")

#Run PART with 1 minus Spearman correlation distance:
res5 <- part(Y, B=10, dist.method="cor", cor.method="spearman")
 




