library(clValid)


### Name: BSI
### Title: Biological Stability Index
### Aliases: BSI
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
bsi <- numeric(ncol(express))
## Need loop over all removed samples
for (del in 1:ncol(express)) {
  matDel <- express[,-del]               
  DistDel <- dist(matDel,method="euclidean")
  clusterObjDel <- hclust(DistDel, method="average")
  clusterDel <- cutree(clusterObjDel,nc)
  bsi[del] <- BSI(cluster, clusterDel, fc)
}
mean(bsi)

## second way - using Bioconductor
if(require("Biobase") && require("annotate") && require("GO.db") &&
   require("moe430a.db")) {
  bsi <- numeric(ncol(express))
  for (del in 1:ncol(express)) {
    matDel <- express[,-del]               
    DistDel <- dist(matDel,method="euclidean")
    clusterObjDel <- hclust(DistDel, method="average")
    clusterDel <- cutree(clusterObjDel,nc)
    bsi[del] <- BSI(cluster, clusterDel, annotation="moe430a.db",
                    names=rownames(express), category="all")
  }
  mean(bsi)
}



