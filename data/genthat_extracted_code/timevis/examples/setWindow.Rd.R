library(timevis)


### Name: setWindow
### Title: Set the current visible window
### Aliases: setWindow

### ** Examples


timevis() %>%
  setWindow(Sys.Date() - 1, Sys.Date() + 1)

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Set window to show between yesterday to tomorrow")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis()
    )
    observeEvent(input$btn, {
      setWindow("timeline", Sys.Date() - 1, Sys.Date() + 1)
    })
  }
)
}



