library(amap)


### Name: hcluster
### Title: Hierarchical Clustering
### Aliases: hcluster hclusterpar
### Keywords: multivariate cluster

### ** Examples


data(USArrests)
hc <- hcluster(USArrests,link = "ave")
plot(hc)
plot(hc, hang = -1)

## Do the same with centroid clustering and squared Euclidean distance,
## cut the tree into ten clusters and reconstruct the upper part of the
## tree from the cluster centers.
hc <- hclust(dist(USArrests)^2, "cen")
memb <- cutree(hc, k = 10)
cent <- NULL
for(k in 1:10){
  cent <- rbind(cent, colMeans(USArrests[memb == k, , drop = FALSE]))
}
hc1 <- hclust(dist(cent)^2, method = "cen", members = table(memb))
opar <- par(mfrow = c(1, 2))
plot(hc,  labels = FALSE, hang = -1, main = "Original Tree")
plot(hc1, labels = FALSE, hang = -1, main = "Re-start from 10 clusters")
par(opar)


## other combinaison are possible

hc <- hcluster(USArrests,method = "euc",link = "ward", nbproc= 1,
doubleprecision = TRUE)
hc <- hcluster(USArrests,method = "max",link = "single", nbproc= 2,
doubleprecision = TRUE)
hc <- hcluster(USArrests,method = "man",link = "complete", nbproc= 1,
doubleprecision = TRUE)
hc <- hcluster(USArrests,method = "can",link = "average", nbproc= 2,
doubleprecision = TRUE)
hc <- hcluster(USArrests,method = "bin",link = "mcquitty", nbproc= 1,
doubleprecision = FALSE)
hc <- hcluster(USArrests,method = "pea",link = "median", nbproc= 2,
doubleprecision = FALSE)
hc <- hcluster(USArrests,method = "abspea",link = "median", nbproc= 2,
doubleprecision = FALSE)
hc <- hcluster(USArrests,method = "cor",link = "centroid", nbproc= 1,
doubleprecision = FALSE)
hc <- hcluster(USArrests,method = "abscor",link = "centroid", nbproc= 1,
doubleprecision = FALSE)
hc <- hcluster(USArrests,method = "spe",link = "complete", nbproc= 2,
doubleprecision = FALSE)
hc <- hcluster(USArrests,method = "ken",link = "complete", nbproc= 2,
doubleprecision = FALSE)






