library(shinyWidgets)


### Name: awesomeRadio
### Title: Awesome Radio Buttons Input Control
### Aliases: awesomeRadio

### ** Examples

## Not run: 
##D 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D ui <- fluidPage(
##D   br(),
##D   awesomeRadio(
##D     inputId = "id1", label = "Make a choice:",
##D     choices = c("graphics", "ggplot2")
##D   ),
##D   verbatimTextOutput(outputId = "res1"),
##D   br(),
##D   awesomeRadio(
##D     inputId = "id2", label = "Make a choice:",
##D     choices = c("base", "dplyr", "data.table"),
##D     inline = TRUE, status = "danger"
##D   ),
##D   verbatimTextOutput(outputId = "res2")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint({
##D     input$id1
##D   })
##D 
##D   output$res2 <- renderPrint({
##D     input$id2
##D   })
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
## End(Not run)



