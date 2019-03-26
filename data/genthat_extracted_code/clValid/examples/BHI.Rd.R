library(clValid)


### Name: BHI
### Title: Biological Homogeneity Index
### Aliases: BHI
### Keywords: cluster

### ** Examples

data(mouse)
express <- mouse[1:25,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID[1:25]
## hierarchical clustering
Dist <- dist(express,method="euclidean")
clusterObj <- hclust(Dist, method="average")
nc <- 4 ## number of clusters      
cluster <- cutree(clusterObj,nc)

## first way - functional classes predetermined
fc <- tapply(rownames(express),mouse$FC[1:25], c)
fc <- fc[-match( c("EST","Unknown"), names(fc))]
fc <- annotationListToMatrix(fc, rownames(express))
BHI(cluster, fc)

## second way - using Bioconductor
if(require("Biobase") && require("annotate") && require("GO.db") &&
require("moe430a.db")) {
  BHI(cluster, annotation="moe430a.db", names=rownames(express), category="all")
}




