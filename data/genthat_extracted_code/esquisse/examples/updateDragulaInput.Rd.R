library(esquisse)


### Name: updateDragulaInput
### Title: Update Dragula Input
### Aliases: updateDragulaInput

### ** Examples


if (interactive()) {

library("shiny")
library("esquisse")

ui <- fluidPage(
  tags$h2("Update dragulaInput"),
  radioButtons(
    inputId = "update", 
    label = "Dataset",
    choices = c("iris", "mtcars")
  ),
  tags$br(),
  dragulaInput(
    inputId = "myDad",
    sourceLabel = "Variables",
    targetsLabels = c("X", "Y", "fill", "color", "size"),
    choices = names(iris), 
    replace = TRUE, width = "400px", status = "success"
  ),
  verbatimTextOutput(outputId = "result")
)

server <- function(input, output, session) {
  
  output$result <- renderPrint(str(input$myDad))
  
  observeEvent(input$update, {
    if (input$update == "iris") {
      updateDragulaInput(
        session = session, 
        inputId = "myDad", 
        choices = names(iris),
        status = "success"
      )
    } else {
      updateDragulaInput(
        session = session, 
        inputId = "myDad", 
        choices = names(mtcars)
      )
    }
  }, ignoreInit = TRUE)
  
}

shinyApp(ui, server)

}




