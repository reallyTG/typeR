library(shinyWidgets)


### Name: awesomeCheckboxGroup
### Title: Awesome Checkbox Group Input Control
### Aliases: awesomeCheckboxGroup

### ** Examples


## Not run: 
##D if (interactive()) {
##D 
##D 
##D ui <- fluidPage(
##D   br(),
##D   awesomeCheckboxGroup(
##D     inputId = "id1", label = "Make a choice:",
##D     choices = c("graphics", "ggplot2")
##D   ),
##D   verbatimTextOutput(outputId = "res1"),
##D   br(),
##D   awesomeCheckboxGroup(
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
##D 
##D }
## End(Not run)



