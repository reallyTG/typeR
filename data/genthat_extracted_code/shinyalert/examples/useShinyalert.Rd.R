library(shinyalert)


### Name: useShinyalert
### Title: Set up a Shiny app to use shinyalert
### Aliases: useShinyalert

### ** Examples

if (interactive()) {
  library(shiny)
  library(shinyalert)

  shinyApp(
    ui = fluidPage(
      useShinyalert(),  # Set up shinyalert
      actionButton("btn", "Click me")
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        # Show a simple modal
        shinyalert(title = "You did it!", type = "success")
      })
    }
  )
}



