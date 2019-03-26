library(colourpicker)


### Name: colourInput
### Title: Create a colour input control
### Aliases: colourInput

### ** Examples

if (interactive()) {
  # Example 1
  library(shiny)
  shinyApp(
    ui = fluidPage(
      colourInput("col", "Choose colour", "red"),
      plotOutput("plot")
    ),
    server = function(input, output, session) {
      output$plot <- renderPlot({
        plot(1:10, col = input$col)
      })
    }
  )

  # Example 2
  library(shiny)
  shinyApp(
    ui = fluidPage(
      strong("Selected colour:", textOutput("value", inline = TRUE)),
      colourInput("col", "Choose colour", "red"),
      h3("Update colour input"),
      textInput("text", "New colour: (colour name or HEX value)"),
      selectInput("showColour", "Show colour",
        c("both", "text", "background")),
      selectInput("palette", "Colour palette",
        c("square", "limited")),
      checkboxInput("allowTransparent", "Allow transparent", FALSE),
      checkboxInput("returnName", "Return R colour name", FALSE),
      actionButton("btn", "Update")
    ),
    server = function(input, output, session) {
      observeEvent(input$btn, {
        updateColourInput(session, "col",
          value = input$text, showColour = input$showColour,
          allowTransparent = input$allowTransparent,
          palette = input$palette,
          returnName = input$returnName)
      })
      output$value <- renderText(input$col)
    }
  )
}



