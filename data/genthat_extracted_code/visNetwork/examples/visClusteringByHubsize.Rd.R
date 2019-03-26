library(visNetwork)


### Name: visClusteringByHubsize
### Title: Network visualization clustering options - by hubsize
### Aliases: visClusteringByHubsize

### ** Examples


set.seed(124)
nodes <- data.frame(id = 1:10, color = c(rep("blue", 6), rep("red", 3), rep("green", 1)))
edges <- data.frame(from = round(runif(6)*10), to = round(runif(6)*10))

visNetwork(nodes, edges) %>%
 visClusteringByHubsize()
 
visNetwork(nodes, edges) %>%
 visClusteringByHubsize(size = 2)
 



