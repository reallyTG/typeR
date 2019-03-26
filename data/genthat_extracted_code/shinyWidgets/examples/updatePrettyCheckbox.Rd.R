library(shinyWidgets)


### Name: updatePrettyCheckbox
### Title: Change the value of a pretty checkbox on the client
### Aliases: updatePrettyCheckbox

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty checkbox update value"),
##D   br(),
##D 
##D   prettyCheckbox(inputId = "checkbox1",
##D                label = "Update me!",
##D                shape = "curve", thick = TRUE, outline = TRUE),
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
##D   output$res1 <- renderPrint(input$checkbox1)
##D 
##D   observeEvent(input$update, {
##D     updatePrettyToggle(session = session,
##D                        inputId = "checkbox1",
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



