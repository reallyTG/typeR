library(shinyWidgets)


### Name: actionGroupButtons
### Title: Actions Buttons Group Inputs
### Aliases: actionGroupButtons

### ** Examples


## Not run: 
##D if (interactive()) {
##D   library("shiny")
##D   library("shinyWidgets")
##D 
##D   ui <- fluidPage(
##D     br(),
##D     actionGroupButtons(
##D       inputIds = c("btn1", "btn2", "btn3"),
##D       labels = list("Action 1", "Action 2", tags$span(icon("gear"), "Action 3")),
##D       status = "primary"
##D     ),
##D     verbatimTextOutput(outputId = "res1"),
##D     verbatimTextOutput(outputId = "res2"),
##D     verbatimTextOutput(outputId = "res3")
##D   )
##D 
##D   server <- function(input, output, session) {
##D 
##D     output$res1 <- renderPrint(input$btn1)
##D 
##D     output$res2 <- renderPrint(input$btn2)
##D 
##D     output$res3 <- renderPrint(input$btn3)
##D 
##D   }
##D 
##D   shinyApp(ui = ui, server = server)
##D }
## End(Not run)




