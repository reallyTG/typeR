library(shinyFeedback)


### Name: feedbackWarning
### Title: feedbackWarning
### Aliases: feedbackWarning

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
      feedbackWarning(
        "exampleInput",
        condition = input$exampleInput < 0
      )
    })
  }
  
  shinyApp(ui, server)
}




