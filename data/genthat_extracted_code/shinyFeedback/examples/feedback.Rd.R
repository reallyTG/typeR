library(shinyFeedback)


### Name: feedback
### Title: feedback
### Aliases: feedback

### ** Examples


## Only run examples in interacive R sessions
if (interactive()) {
  ui <- fluidPage(
    useShinyFeedback(),
    
    numericInput(
      "exampleInput",
      "Show Feedback When < 0",
      value = -5
    )
  )
  
  server <- function(input, output) {
    observeEvent(input$exampleInput, {
      feedback(
        "exampleInput",
        condition = input$exampleInput < 0,
        text = "I am negative",
        color = "#d9534f",
        icon = shiny::icon("exclamation-sign", lib="glyphicon")
      )
    })
  }
  
  shinyApp(ui, server)
}




