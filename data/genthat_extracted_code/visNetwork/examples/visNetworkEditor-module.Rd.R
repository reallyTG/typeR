library(visNetwork)


### Name: visNetworkEditor-module
### Title: Module shiny for visualize and customize and get back a
###   'visNetwork' object. Using the javascript interface visConfigure.
### Aliases: visNetworkEditor-module visNetworkEditorServer
###   visNetworkEditorUI

### ** Examples

## Not run: 
##D 
##D nodes <- data.frame(id = 1:3, label = paste("Node", 1:3))
##D edges <- data.frame(from = c(1,2), to = c(1,3), label = paste("Edge", 1:2))
##D network <- visNetwork(nodes, edges)
##D 
##D shiny::shinyApp(ui = shiny::fluidPage(
##D  visNetworkEditorUI(id = "id1")), 
##D  server = function(input, output, session) {
##D  shiny::callModule(visNetworkEditorServer, "id1", object = shiny::reactive(network))
##D })
##D 
## End(Not run)



