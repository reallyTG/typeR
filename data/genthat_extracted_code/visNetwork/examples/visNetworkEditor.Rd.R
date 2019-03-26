library(visNetwork)


### Name: visNetworkEditor
### Title: Visualize, customize and get back a 'visNetwork' object. Need
###   shiny package
### Aliases: visNetworkEditor

### ** Examples


## Not run: 
##D 
##D nodes <- data.frame(id = 1:3, label = paste("Node", 1:3))
##D edges <- data.frame(from = c(1,2), to = c(1,3), label = paste("Edge", 1:2))
##D network <- visNetwork(nodes, edges)
##D 
##D custom_network <- visNetworkEditor(object = network)
##D custom_network
##D 
##D custom_network <- visNetworkEditor(object = network, filter = "nodes,edges")
##D custom_network
##D 
## End(Not run)




