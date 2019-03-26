library(shinyjs)


### Name: delay
### Title: Execute R code after a specified number of milliseconds has
###   elapsed
### Aliases: delay

### ** Examples

if (interactive()) {
  library(shiny)
  shinyApp(
    ui = fluidPage(
      useShinyjs(),
      p(id = "text", "This text will disappear after 3 seconds"),
      actionButton("close", "Close the app in half a second")
    ),
    server = function(input, output) {
      delay(3000, hide("text"))
      observeEvent(input$close, {
        delay(500, stopApp())
      })
    }
  )
}



