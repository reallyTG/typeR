library(shinyjs)


### Name: runjs
### Title: Run JavaScript code
### Aliases: runjs

### ** Examples

if (interactive()) {
  library(shiny)
  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me")
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        # Run JS code that simply shows a message
        runjs("var today = new Date(); alert(today);")
      })
    }
  )
}



