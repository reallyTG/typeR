library(shiny)


### Name: shinyServer
### Title: Define Server Functionality
### Aliases: shinyServer

### ** Examples

## Not run: 
##D # A very simple Shiny app that takes a message from the user
##D # and outputs an uppercase version of it.
##D shinyServer(function(input, output, session) {
##D   output$uppercase <- renderText({
##D     toupper(input$message)
##D   })
##D })
##D 
##D 
##D # It is also possible for a server.R file to simply return the function,
##D # without calling shinyServer().
##D # For example, the server.R file could contain just the following:
##D function(input, output, session) {
##D   output$uppercase <- renderText({
##D     toupper(input$message)
##D   })
##D }
## End(Not run)



