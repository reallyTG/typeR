library(hkclustering)


### Name: hkclustering
### Title: Clustering function
### Aliases: hkclustering
### Keywords: kmeans_clustering hierarchical_clustering

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

 
a<-runif(500, min=3.5, max=2000)
b<-runif(500, min=1.5, max=2000)
df = data.frame(a, b) 

#Specifying  4 clusters
results.hkclust<-hkclustering(df,4,100)
centroidssummary(results.hkclust)
with(results.hkclust, pairs(results.hkclust[,1:2], col=c(1:10)[results.hkclust[,3]]))

## The function is currently defined as
function (df, numbk, t) 
{
    scaled.df <- scale(df)
    rm(.Random.seed, envir = globalenv())
    temp <- kmeans(scaled.df, numbk)
    c <- temp$centers
    c <- temp$centers
    for (i in 2:t) {
        rm(.Random.seed, envir = globalenv())
        temp <- kmeans(scaled.df, numbk)
        c <- rbind(c, temp$centers)
    }
    cr <- as.data.frame(c, row.names = F)
    d <- dist(cr, method = "euclidean")
    fit <- hclust(d, method = "centroid")
    cr$clusnumber <- cutree(fit, k = numbk)
    centroids1 <- aggregate(cr, by = list(cr$clusnumber), FUN = mean)
    centr <- centroids1[, c(2:(length(df) + 1))]
    final <- kmeans(scaled.df, centr)
    clustereddata <- cbind(df, final$cluster)
    colnames(clustereddata)[(length(df) + 1)] <- "cluster_number"
    return(clustereddata)
  }



