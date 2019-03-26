library(esquisse)


### Name: dragulaInput
### Title: Drag And Drop Input Widget
### Aliases: dragulaInput

### ** Examples


if (interactive()) {

library("shiny")
library("esquisse")

ui <- fluidPage(
  tags$h2("Demo dragulaInput"),
  tags$br(),
  dragulaInput(
    inputId = "dad",
    sourceLabel = "Source",
    targetsLabels = c("Target 1", "Target 2"),
    choices = names(iris),
    width = "400px"
  ),
  verbatimTextOutput(outputId = "result")
)


server <- function(input, output, session) {
  
  output$result <- renderPrint(str(input$dad))

}

shinyApp(ui = ui, server = server)

}




