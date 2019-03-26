library(dave)


### Name: centroid
### Title: Centroids of row groups (vegetation releves)
### Aliases: centroid centroid.default print.centroid rcentroid
### Keywords: array misc

### ** Examples

# This generates a typical artificial vegetation data frame aveg
v1<- matrix(rep(0,200),nrow=10)        
diag(v1)<-1 ; diag(v1[,2:12])<-1 ; diag(v1[,3:13])<-2 ; diag(v1[,4:14])<-1
diag(v1[,5:15])<-1 ; diag(v1[5:8,3:6])<-3 ; aveg<- data.frame(v1[,2:13])

# First, groups of releves are formed by cluster analysis
require(vegan)
dr<- vegdist(aveg^0.5,method="bray")      # dr is distance matrix of rows
o.clr<- hclust(dr,method="ward")          # this is clustering
grel<- cutree(o.clr,k=3)                  # 3 row groups formed
o.centroid<- centroid(aveg,grel,y=0.5)
o.centroid                                # printing the matrix




