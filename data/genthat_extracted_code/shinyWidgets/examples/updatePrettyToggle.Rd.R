library(shinyWidgets)


### Name: updatePrettyToggle
### Title: Change the value of a pretty toggle on the client
### Aliases: updatePrettyToggle

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty toggle update value"),
##D   br(),
##D 
##D   prettyToggle(inputId = "toggle1",
##D                label_on = "Checked!",
##D                label_off = "Unchecked..."),
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
##D   output$res1 <- renderPrint(input$toggle1)
##D 
##D   observeEvent(input$update, {
##D     updatePrettyToggle(session = session,
##D                        inputId = "toggle1",
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



