library(shinyWidgets)


### Name: prettySwitch
### Title: Pretty Switch Input
### Aliases: prettySwitch

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty switches"),
##D   br(),
##D 
##D   fluidRow(
##D     column(
##D       width = 4,
##D       prettySwitch(inputId = "switch1", label = "Default:"),
##D       verbatimTextOutput(outputId = "res1"),
##D       br(),
##D       prettySwitch(inputId = "switch4",
##D                    label = "Fill switch with status:",
##D                    fill = TRUE, status = "primary"),
##D       verbatimTextOutput(outputId = "res4")
##D     ),
##D     column(
##D       width = 4,
##D       prettySwitch(inputId = "switch2",
##D                    label = "Danger status:",
##D                    status = "danger"),
##D       verbatimTextOutput(outputId = "res2")
##D     ),
##D     column(
##D       width = 4,
##D       prettySwitch(inputId = "switch3",
##D                    label = "Slim switch:",
##D                    slim = TRUE),
##D       verbatimTextOutput(outputId = "res3")
##D     )
##D   )
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$switch1)
##D   output$res2 <- renderPrint(input$switch2)
##D   output$res3 <- renderPrint(input$switch3)
##D   output$res4 <- renderPrint(input$switch4)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
##D 
## End(Not run)



