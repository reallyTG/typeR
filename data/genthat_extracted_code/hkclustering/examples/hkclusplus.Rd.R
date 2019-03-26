library(hkclustering)


### Name: hkclusplus
### Title: hkclusplus
### Aliases: hkclusplus
### Keywords: hierarchical_clustering gap_statistic

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

a<-runif(300, min=3.5, max=2000)
b<-runif(300, min=1.5, max=2000)
df = data.frame(a, b) 

#Let the Gap statistic to find the clusters
results.hkplus<-hkclusplus(df,100)
centroidssummary(results.hkplus)
with(results.hkplus, pairs(results.hkplus[,1:2], col=c(1:7)[results.hkplus[,3]]))

## The function is currently defined as
function (df, t) 
{
    library(cluster)
    scaled.df <- scale(df)
    numbk <- which.max(clusGap(scaled.df, FUN = kmeans, K.max = 8, 
        B = 200)$Tab[, 3])
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



