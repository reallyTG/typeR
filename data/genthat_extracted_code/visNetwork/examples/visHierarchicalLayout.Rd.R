library(visNetwork)


### Name: visHierarchicalLayout
### Title: Network visualization Hierarchical layout options
### Aliases: visHierarchicalLayout

### ** Examples


nodes <- data.frame(id = 1:10)
edges <- data.frame(from = round(runif(8)*10), to = round(runif(8)*10))

visNetwork(nodes, edges) %>%
 visHierarchicalLayout()

visNetwork(nodes, edges) %>%
 visHierarchicalLayout(direction = "LR")
 



