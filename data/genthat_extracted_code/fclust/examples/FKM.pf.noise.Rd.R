library(fclust)


### Name: FKM.pf.noise
### Title: Fuzzy k-means with polynomial fuzzifier and noise cluster
### Aliases: FKM.pf.noise
### Keywords: multivariate

### ** Examples

## McDonald's data
data(Mc)
names(Mc)
## data normalization by dividing the nutrition facts by the Serving Size (column 1)
for (j in 2:(ncol(Mc)-1))
Mc[,j]=Mc[,j]/Mc[,1]
## removing the column Serving Size
Mc=Mc[,-1]
## fuzzy k-means with polynomial fuzzifier and noise cluster, fixing the number of clusters 
## (excluded the factor column Type (last column))
clust=FKM.pf.noise(Mc[,1:(ncol(Mc)-1)],k=6,stand=1)
## fuzzy k-means with polynomial fuzzifier and noise cluster, selecting the number of clusters 
## (excluded the factor column Type (last column))
clust=FKM.pf.noise(Mc[,1:(ncol(Mc)-1)],k=2:6,stand=1)



