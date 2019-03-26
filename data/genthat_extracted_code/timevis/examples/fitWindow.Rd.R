library(timevis)


### Name: fitWindow
### Title: Adjust the visible window such that it fits all items
### Aliases: fitWindow

### ** Examples

if (interactive()) {
library(shiny)
shinyApp(
  ui = fluidPage(
    timevisOutput("timeline"),
    actionButton("btn", "Fit all items")
  ),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis(data.frame(
        id = 1:2, start = c(Sys.Date(), Sys.Date() - 1), content = c("1", "2")
      ))
    )
    observeEvent(input$btn, {
      fitWindow("timeline", list(animation = FALSE))
    })
  }
)
}



