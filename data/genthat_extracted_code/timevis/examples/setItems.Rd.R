library(timevis)


### Name: setItems
### Title: Set the items of a timeline
### Aliases: setItems

### ** Examples


timevis(data.frame(start = Sys.Date(), content = "Today")) %>%
  setItems(data.frame(start = Sys.Date() - 1, content = "yesterday"))

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Change the data to yesterday")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis(data.frame(start = Sys.Date(), content = "Today"))
    )
    observeEvent(input$btn, {
      setItems("timeline",
               data.frame(start = Sys.Date() - 1, content = "yesterday"))
    })
  }
)
}



