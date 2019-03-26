library(timevis)


### Name: centerItem
### Title: Move the window such that given item or items are centered
### Aliases: centerItem

### ** Examples


timevis(data.frame(
          id = 1:3,
          start = c(Sys.Date() - 1, Sys.Date(), Sys.Date() + 1),
          content = c("Item 1", "Item 2", "Item 3"))
) %>%
  centerItem(1)

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Center around item 1")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis(
        data.frame(id = 1:3,
          start = c(Sys.Date() - 1, Sys.Date(), Sys.Date() + 1),
          content = c("Item 1", "Item 2", "Item 3"))
      )
    )
    observeEvent(input$btn, {
      centerItem("timeline", 1)
    })
  }
)
}



