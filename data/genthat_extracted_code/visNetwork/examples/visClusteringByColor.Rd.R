library(visNetwork)


### Name: visClusteringByColor
### Title: Network visualization clustering options - by color
### Aliases: visClusteringByColor

### ** Examples


set.seed(124)
nodes <- data.frame(id = 1:10, color = c(rep("blue", 6), rep("red", 3), rep("green", 1)))
edges <- data.frame(from = round(runif(6)*10), to = round(runif(6)*10))

visNetwork(nodes, edges) %>%
 visClusteringByColor(colors = c("blue"))
 
 nodes <- data.frame(id = 1:10, label = paste("Label", 1:10), 
   group = sample(c("A", "B"), 10, replace = TRUE))
 edges <- data.frame(from = c(2,5,10), to = c(1,2,10))

 visNetwork(nodes, edges) %>%
   visGroups(groupname = "A", color = "red", shape = "square") %>%
   visGroups(groupname = "B", color = "yellow", shape = "triangle") %>%
   visClusteringByColor(colors = c("red"), label = "With color ") %>%
   visClusteringByGroup(groups = c("B"), label = "Group : ") %>%
   visLegend()
   
 visNetwork(nodes, edges) %>%
   visGroups(groupname = "A", color = "red", shape = "triangle") %>%
   visGroups(groupname = "B", color = "yellow", shape = "triangle") %>%
   visClusteringByGroup(groups = c("A","B")) %>%
   visLegend()



