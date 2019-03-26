library(timevis)


### Name: removeItem
### Title: Remove an item from a timeline
### Aliases: removeItem

### ** Examples


timevis(data.frame(id = 1:2, start = Sys.Date(), content = c("1", "2"))) %>%
  removeItem(2)

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Remove item 2")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis(data.frame(
        id = 1:2, start = Sys.Date(), content = c("1", "2"))
      )
    )
    observeEvent(input$btn, {
      removeItem("timeline", 2)
    })
  }
)
}



