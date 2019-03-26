library(lmomRFA)


### Name: clukm
### Title: Cluster analysis via K-means algorithm
### Aliases: clukm
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
(cl <- cluagg(att))
# Details of the clustering with 7 clusters
(inf <- cluinf(cl, 7))
# Refine the 7 clusters by K-means
clkm <- clukm(att, inf$assign)
# Compare the original and K-means clusters
table(Kmeans=clkm$cluster, Ward=inf$assign)
# Some details about the K-means clusters: range of area, number
# of sites, weighted average L-CV and L-skewness
bb <- by(Appalach, clkm$cluster, function(x)
  c( min.area = min(x$area),
     max.area = max(x$area),
     n = nrow(x),
     ave.t = round(weighted.mean(x$t, x$n), 3),
     ave.t_3 = round(weighted.mean(x$t_3, x$n), 3)))
# Order the clusters in increasing order of minimum area
ord <- order(sapply(bb, "[", "min.area"))
# Make the result into a data frame.  Compare with Hosking
# and Wallis (1997), Table 9.5.
do.call(rbind, bb[ord])



