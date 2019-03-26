library(googleAnalyticsR)


### Name: segmentBuilder
### Title: Create a GAv4 Segment Builder
### Aliases: segmentBuilder

### ** Examples


## Not run: 
##D 
##D library(shiny)
##D library(googleAnalyticsR)
##D 
##D ui <- shinyUI(fluidPage(
##D                segmentBuilderUI("test1")
##D                ))
##D                
##D                
##D server <- shinyServer(function(input, output, session) {
##D 
##D segment <- callModule(segmentBuilder, "test1")
##D 
##D   .. use segment() in further gav4 calls.
##D   
##D })
##D 
##D 
##D # Run the application 
##D shinyApp(ui = ui, server = server)
## End(Not run)




