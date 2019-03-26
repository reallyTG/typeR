library(hkclustering)


### Name: centroidssummary
### Title: Returns Centroids summary
### Aliases: centroidssummary
### Keywords: centroids summary

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (clustereddata) 
{
    colnames(clustereddata)[(length(clustereddata))] <- "cluster_number"
    centroids <- aggregate(clustereddata, by = list(clustereddata$cluster_number), 
        FUN = mean)
    clustereddata$counts <- 1
    centroids <- cbind(centroids, aggregate(counts ~ cluster_number, 
        data = clustereddata, FUN = sum))
    centroids <- centroids[, c((length(df) + 2), 2:(length(df) + 
        1), (length(df) + 4))]
    return(centroids)
  }



