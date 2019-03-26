library(shinyjs)


### Name: hidden
### Title: Initialize a Shiny tag as hidden
### Aliases: hidden

### ** Examples

if (interactive()) {
  library(shiny)
  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me"),
      hidden(
        p(id = "element", "I was born invisible")
      )
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        show("element")
      })
    }
  )
}

library(shiny)
hidden(span(id = "a"), div(id = "b"))
hidden(tagList(span(id = "a"), div(id = "b")))
hidden(list(span(id = "a"), div(id = "b")))



