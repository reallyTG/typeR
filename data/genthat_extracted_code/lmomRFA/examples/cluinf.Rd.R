library(lmomRFA)


### Name: cluinf
### Title: Provide information about a hierarchical clustering
### Aliases: cluinf
### Keywords: cluster

### ** Examples

## Clustering of gaging stations in Appalachia, as in Hosking
## and Wallis (1997, sec. 9.2.3)
data(Appalach)
# Form attributes for clustering (Hosking and Wallis's Table 9.4)
att <- cbind(a1 = log(Appalach$area),
             a2 = sqrt(Appalach$elev),
             a3 = Appalach$lat,
             a4 = Appalach$long)
att <- apply(att, 2, function(x) x/sd(x))
att[,1] <- att[,1] * 3
# Clustering by Ward's method
(cl<-cluagg(att))
# Details of the clustering with 7 clusters
cluinf(cl, 7)



