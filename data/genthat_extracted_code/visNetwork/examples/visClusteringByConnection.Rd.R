library(visNetwork)


### Name: visClusteringByConnection
### Title: Network visualization clustering options - by node id
### Aliases: visClusteringByConnection

### ** Examples


set.seed(124)
nodes <- data.frame(id = 1:10, color = c(rep("blue", 6), rep("red", 3), rep("green", 1)))
edges <- data.frame(from = round(runif(6)*10), to = round(runif(6)*10))

 visNetwork(nodes, edges) %>%
   visClusteringByConnection(nodes = 9)
     



