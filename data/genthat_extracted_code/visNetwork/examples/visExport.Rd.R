library(visNetwork)


### Name: visExport
### Title: Network export configuration
### Aliases: visExport

### ** Examples


## Not run: 
##D 
##D nodes <- data.frame(id = 1:3, group = c("B", "A", "B"))
##D edges <- data.frame(from = c(1,2), to = c(2,3))
##D 
##D visNetwork(nodes, edges) %>%
##D  visGroups(groupname = "A", color = "red") %>%
##D  visGroups(groupname = "B", color = "lightblue") %>%
##D  visLegend() %>% visExport() 
##D  
##D visNetwork(nodes, edges) %>%
##D  visGroups(groupname = "A", color = "red") %>%
##D  visGroups(groupname = "B", color = "lightblue") %>%
##D  visLegend() %>% visExport(type = "jpeg", name = "export-network", 
##D    float = "left", label = "Save network", background = "purple", style= "") 
##D  
## End(Not run)



