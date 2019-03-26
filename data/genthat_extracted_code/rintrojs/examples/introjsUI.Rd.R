library(rintrojs)


### Name: introjsUI
### Title: Set up Shiny app to use intro.js
### Aliases: introjsUI

### ** Examples

## Not run: 
##D library(rintrojs)
##D library(shiny)
##D 
##D shinyApp(
##D ui = fluidPage(
##D   introjsUI(), # must include in UI
##D   actionButton("btn", "Click me")
##D ),
##D server = function(input, output, session) {
##D   observeEvent(input$btn, {
##D     intro <- data.frame(element="#btn",
##D                         intro="In Codd we trust")
##D     introjs(session, options = list(steps= intro))
##D   })
##D }
##D )
## End(Not run)



