library(ClustVarLV)


### Name: CLV_kmeans
### Title: K-means algorithm for the clustering of variables
### Aliases: CLV_kmeans

### ** Examples

data(apples_sh)
#local groups with external variables Xr 
resclvkmYX <- CLV_kmeans(X = apples_sh$pref, Xr = apples_sh$senso,method = "local",
          sX = FALSE, sXr = TRUE, clust = 2, nstart = 20)



