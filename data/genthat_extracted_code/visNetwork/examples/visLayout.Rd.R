library(visNetwork)


### Name: visLayout
### Title: Network visualization layout options
### Aliases: visLayout

### ** Examples


nodes <- data.frame(id = 1:10)
edges <- data.frame(from = round(runif(8)*10), to = round(runif(8)*10))

# fix seed, so you retrieve same network each time...!
visNetwork(nodes, edges) %>%
 visLayout(randomSeed = 123) 

visNetwork(nodes, edges) %>%
 visLayout(randomSeed = 123)   
 
# hierarchical
visNetwork(nodes, edges) %>%
 visLayout(hierarchical = TRUE) 
 
visNetwork(nodes, edges) %>%
 visHierarchicalLayout(direction = "LR")




