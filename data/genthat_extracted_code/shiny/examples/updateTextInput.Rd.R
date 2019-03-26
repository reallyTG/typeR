library(shiny)


### Name: updateTextInput
### Title: Change the value of a text input on the client
### Aliases: updateTextInput

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  sliderInput("controller", "Controller", 0, 20, 10),
  textInput("inText", "Input text"),
  textInput("inText2", "Input text 2")
)

server <- function(input, output, session) {
  observe({
    # We'll use the input$controller variable multiple times, so save it as x
    # for convenience.
    x <- input$controller

    # This will change the value of input$inText, based on x
    updateTextInput(session, "inText", value = paste("New text", x))

    # Can also set the label, this time for input$inText2
    updateTextInput(session, "inText2",
      label = paste("New label", x),
      value = paste("New text", x))
  })
}

shinyApp(ui, server)
}



