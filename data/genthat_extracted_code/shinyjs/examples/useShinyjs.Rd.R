library(shinyjs)


### Name: useShinyjs
### Title: Set up a Shiny app to use shinyjs
### Aliases: useShinyjs

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me"),
      textInput("element", "Watch what happens to me")
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        # Run a simply shinyjs function
        toggle("element")
      })
    }
  )
}



