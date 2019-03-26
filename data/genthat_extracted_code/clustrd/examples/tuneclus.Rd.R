library(clustrd)


### Name: tuneclus
### Title: Cluster quality assessment for a range of clusters and
###   dimensions.
### Aliases: tuneclus print.tuneclus summary.tuneclus fitted.tuneclus

### ** Examples

# Reduced K-means for a range of clusters and dimensions
data(macro)
# Cluster quality assessment based on the average silhouette width # in the low dimensional space
bestRKM = tuneclus(macro, 3:4, 2:3, method = "RKM", criterion = "asw", dst = "low", nstart = 10)
bestRKM
plot(bestRKM)

# Cluster Correspondence Analysis for a range of clusters and dimensions
data(hsq)
# Cluster quality assessment based on the average silhouette width # in the full dimensional space
bestclusCA = tuneclus(hsq[,1:4], 3:4, 2:3, method = "clusCA", criterion = "asw", nstart = 10)
bestclusCA
plot(bestclusCA)



