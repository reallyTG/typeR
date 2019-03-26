library(timevis)


### Name: removeCustomTime
### Title: Remove a custom time previously added
### Aliases: removeCustomTime

### ** Examples


timevis() %>%
  addCustomTime(Sys.Date() - 1, "yesterday") %>%
  addCustomTime(Sys.Date() + 1, "tomorrow") %>%
  removeCustomTime("yesterday")

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn0", "Add custom time"),
    actionButton("btn", "Remove custom time bar")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis()
    )
    observeEvent(input$btn0, {
      addCustomTime("timeline", Sys.Date() - 1, "yesterday")
    })
    observeEvent(input$btn, {
      removeCustomTime("timeline", "yesterday")
    })
  }
)
}



