library(timevis)


### Name: centerTime
### Title: Move the window such that the given time is centered
### Aliases: centerTime

### ** Examples


timevis() %>%
  centerTime(Sys.Date() - 1)

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Center around 24 hours ago")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis()
    )
    observeEvent(input$btn, {
      centerTime("timeline", Sys.Date() - 1)
    })
  }
)
}



