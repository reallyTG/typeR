library(shinyWidgets)


### Name: actionBttn
### Title: Awesome action button
### Aliases: actionBttn

### ** Examples

## Not run: 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h2("Awesome action button"),
##D   tags$br(),
##D   actionBttn(
##D     inputId = "bttn1",
##D     label = "Go!",
##D     color = "primary",
##D     style = "bordered"
##D   ),
##D   tags$br(),
##D   verbatimTextOutput(outputId = "res_bttn1"),
##D   tags$br(),
##D   actionBttn(
##D     inputId = "bttn2",
##D     label = "Go!",
##D     color = "success",
##D     style = "material-flat",
##D     icon = icon("sliders"),
##D     block = TRUE
##D   ),
##D   tags$br(),
##D   verbatimTextOutput(outputId = "res_bttn2")
##D )
##D 
##D server <- function(input, output, session) {
##D   output$res_bttn1 <- renderPrint(input$bttn1)
##D   output$res_bttn2 <- renderPrint(input$bttn2)
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
## End(Not run)



