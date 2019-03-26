library(visNetwork)


### Name: visGroups
### Title: Network visualization groups options
### Aliases: visGroups

### ** Examples


nodes <- data.frame(id = 1:10, label = paste("Label", 1:10), 
 group = sample(c("A", "B"), 10, replace = TRUE))
 edges <- data.frame(from = c(2,5,10), to = c(1,2,10))

visNetwork(nodes, edges) %>%
 visLegend() %>%
 visGroups(groupname = "A", color = "red", shape = "database") %>%
 visGroups(groupname = "B", color = "yellow", shape = "triangle")
 



