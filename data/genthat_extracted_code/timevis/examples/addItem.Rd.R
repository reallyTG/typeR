library(timevis)


### Name: addItem
### Title: Add a single item to a timeline
### Aliases: addItem

### ** Examples


timevis() %>%
  addItem(list(start = Sys.Date(), content = "Today"))

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Add item today")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis()
    )
    observeEvent(input$btn, {
      addItem("timeline", list(start = Sys.Date(), content = "Today"))
    })
  }
)
}



