library(visNetwork)


### Name: addIonicons
### Title: Use Ionicons in visNetwork 'graph'
### Aliases: addIonicons

### ** Examples


nodes <- data.frame(id = 1:3, group = c("B", "A", "B"))
edges <- data.frame(from = c(1,2), to = c(2,3))

visNetwork(nodes, edges) %>%
  visGroups(groupname = "A", shape = "icon", 
   icon = list(face ='Ionicons', code = "f101", size = 75)) %>%
  visGroups(groupname = "B", shape = "icon", 
   icon = list(face ='Ionicons', code = "f100", color = "red")) %>%
  addIonicons()




