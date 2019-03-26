library(shinyjs)


### Name: disabled
### Title: Initialize a Shiny input as disabled
### Aliases: disabled

### ** Examples

if (interactive()) {
  library(shiny)
  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me"),
      disabled(
        textInput("element", NULL, "I was born disabled")
      )
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        enable("element")
      })
    }
  )
}

library(shiny)
disabled(numericInput("num", NULL, 5), dateInput("date", NULL))



