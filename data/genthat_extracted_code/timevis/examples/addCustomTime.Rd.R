library(timevis)


### Name: addCustomTime
### Title: Add a new vertical bar at a time point that can be dragged by
###   the user
### Aliases: addCustomTime

### ** Examples


timevis() %>%
  addCustomTime(Sys.Date() - 1, "yesterday")

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Add time bar 24 hours ago")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis()
    )
    observeEvent(input$btn, {
      addCustomTime("timeline", Sys.Date() - 1, "yesterday")
    })
  }
)
}



