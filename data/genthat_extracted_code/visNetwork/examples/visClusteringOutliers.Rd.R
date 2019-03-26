library(visNetwork)


### Name: visClusteringOutliers
### Title: Network visualization clustering options - outliers
### Aliases: visClusteringOutliers

### ** Examples

 
nodes <- data.frame(id = 1:10)
edges <- data.frame(from = c(1,1,10,2,6,7,8,9,10), 
                    to = c(2,3,4,5,2,5,6,7,9))

visNetwork(nodes, edges) %>%
 visClusteringOutliers(1)

 



