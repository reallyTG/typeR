library(shinyWidgets)


### Name: updatePrettySwitch
### Title: Change the value of a pretty switch on the client
### Aliases: updatePrettySwitch

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty switch update value"),
##D   br(),
##D 
##D   prettySwitch(inputId = "switch1", label = "Update me !"),
##D   verbatimTextOutput(outputId = "res1"),
##D   radioButtons(
##D     inputId = "update", label = "Value to set:",
##D     choices = c("FALSE", "TRUE")
##D   )
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$switch1)
##D 
##D   observeEvent(input$update, {
##D     updatePrettySwitch(session = session, inputId = "switch1",
##D                        value = as.logical(input$update))
##D   })
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



