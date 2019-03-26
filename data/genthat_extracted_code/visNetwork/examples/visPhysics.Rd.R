library(visNetwork)


### Name: visPhysics
### Title: Network visualization Physics options
### Aliases: visPhysics

### ** Examples


nodes <- data.frame(id = 1:10)
edges <- data.frame(from = round(runif(8)*10), to = round(runif(8)*10))

visNetwork(nodes, edges) %>%
 visPhysics(solver = "repulsion")

visNetwork(nodes, edges) %>%
 visPhysics(solver = "forceAtlas2Based", forceAtlas2Based = list(gravitationalConstant = -10))
 
visNetwork(nodes, edges) %>%
 visPhysics(stabilization = FALSE)





