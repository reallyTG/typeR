library(visNetwork)


### Name: visInteraction
### Title: Network visualization interaction
### Aliases: visInteraction

### ** Examples


nodes <- data.frame(id = 1:10, 
 title = '<a target="_blank" href="https://github.com/datastorm-open/visNetwork">github</a>')
edges <- data.frame(from = round(runif(8)*10), to = round(runif(8)*10))

# custom tooltip
visNetwork(nodes, edges) %>%
visInteraction(tooltipStyle = 'position: fixed;visibility:hidden;padding: 5px;white-space: nowrap;
 font-family: cursive;font-size:18px;font-color:purple;background-color: red;')

# frozen network
visNetwork(nodes, edges) %>%
 visInteraction(dragNodes = FALSE, dragView = FALSE, zoomView = FALSE)

visNetwork(nodes, edges) %>%
 visInteraction(hideEdgesOnDrag = TRUE)
 
visNetwork(nodes, edges) %>%
 visInteraction(hover = TRUE)
 
# navigation button  
visNetwork(nodes, edges) %>%
 visInteraction(navigationButtons = TRUE)
 
visNetwork(nodes, edges) %>%
 visInteraction(selectConnectedEdges = FALSE)
 
visNetwork(nodes, edges) %>%
 visInteraction(multiselect = TRUE)
 
visNetwork(nodes, edges) %>%
  visInteraction(keyboard = TRUE)
 



