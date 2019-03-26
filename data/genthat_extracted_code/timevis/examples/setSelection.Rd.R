library(timevis)


### Name: setSelection
### Title: Select one or multiple items on a timeline
### Aliases: setSelection

### ** Examples


timevis(data.frame(id = 1:3, start = Sys.Date(), content = 1:3)) %>%
  setSelection(2)

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Select item 2")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis(
        data.frame(id = 1:3, start = Sys.Date(), content = 1:3)
      )
    )
    observeEvent(input$btn, {
      setSelection("timeline", 2)
    })
  }
)
}



