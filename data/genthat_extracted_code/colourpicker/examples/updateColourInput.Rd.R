library(colourpicker)


### Name: updateColourInput
### Title: Change the value of a colour input
### Aliases: updateColourInput

### ** Examples

if (interactive()) {
  library(shiny)
  shinyApp(
    ui = fluidPage(
      div("Selected colour:", textOutput("value", inline = TRUE)),
      colourInput("col", "Choose colour", "red"),
      h3("Update colour input"),
      textInput("text", "New colour: (colour name or HEX value)"),
      selectInput("showColour", "Show colour",
        c("both", "text", "background")),
      checkboxInput("allowTransparent", "Allow transparent", FALSE),
      checkboxInput("returnName", "Return R colour name", FALSE),
      actionButton("btn", "Update")
    ),
    server = function(input, output, session) {
      observeEvent(input$btn, {
        updateColourInput(session, "col",
          value = input$text, showColour = input$showColour,
          allowTransparent = input$allowTransparent,
          returnName = input$returnName)
      })
      output$value <- renderText(input$col)
    }
  )
}



