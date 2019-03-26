library(visNetwork)


### Name: visConfigure
### Title: Network visualization configure options
### Aliases: visConfigure

### ** Examples


## Not run: 
##D 
##D nodes <- data.frame(id = 1:3, title = paste0("<p>", 1:3,"<br> tooltip</p>"))
##D edges <- data.frame(from = c(1,2), to = c(1,3))
##D 
##D visNetwork(nodes, edges) %>%
##D  visConfigure(enabled = TRUE, filter = "interaction")
##D  
##D # using visNetworkEditor
##D custom_network <- visNetworkEditor(object = network)
##D custom_network
##D 
##D custom_network <- visNetworkEditor(object = network, filter = "nodes,edges")
##D custom_network
## End(Not run)




