library(visNetwork)


### Name: visNetwork-treeModule
### Title: Module shiny for visualize and customize a 'rpart' tree
### Aliases: visNetwork-treeModule visTreeModuleServer visTreeModuleUI

### ** Examples

## Not run: 
##D 
##D require(rpart)
##D # simple module editor on rpart
##D data <- iris
##D shiny::shinyApp(ui = shiny::fluidPage(
##D visTreeModuleUI(id = "id1", rpartParams = FALSE, visTreeParams = FALSE)), 
##D  server = function(input, output, session) {
##D  shiny::callModule(visTreeModuleServer, "id1", data = shiny::reactive(rpart(data)))
##D })
##D 
##D # full module editor on rpart + data.frame for sparkline
##D data <- iris
##D shiny::shinyApp(ui = shiny::fluidPage(
##D  visTreeModuleUI(id = "id1", rpartParams = FALSE, visTreeParams = TRUE)), 
##D  server = function(input, output, session) {
##D  shiny::callModule(visTreeModuleServer, "id1", data = shiny::reactive(rpart(data)), 
##D  tooltip_data = data)
##D })
##D 
##D # module on data.frame
##D shiny::shinyApp(ui = shiny::fluidPage(visTreeModuleUI(id = "id1",
##D  rpartParams = TRUE)), 
##D  server = function(input, output, session) {
##D  shiny::callModule(visTreeModuleServer, "id1", data = shiny::reactive(data))
##D })
##D 
##D # multiple modules
##D shiny::shinyApp(ui = 
##D navbarPage("Menu",shiny::tabPanel(
##D   "tt1",shiny::fluidPage(visTreeModuleUI(id = "id1", 
##D   rpartParams = TRUE,
##D   visTreeParams = TRUE))
##D ),
##D shiny::tabPanel(
##D   "tt2",shiny::fluidPage(visTreeModuleUI(id = "id2", 
##D   rpartParams = FALSE,
##D   visTreeParams = FALSE)))
##D ), 
##D server = function(input, output, session) {
##D   shiny::callModule(visTreeModuleServer, "id1", data = shiny::reactive(iris))
##D   shiny::callModule(visTreeModuleServer, "id2", data = shiny::reactive(rpart(iris)))
##D })
## End(Not run)




