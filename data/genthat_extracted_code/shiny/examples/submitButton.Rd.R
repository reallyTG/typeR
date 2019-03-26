library(shiny)


### Name: submitButton
### Title: Create a submit button
### Aliases: submitButton

### ** Examples

if (interactive()) {

shinyApp(
  ui = basicPage(
    numericInput("num", label = "Make changes", value = 1),
    submitButton("Update View", icon("refresh")),
    helpText("When you click the button above, you should see",
             "the output below update to reflect the value you",
             "entered at the top:"),
    verbatimTextOutput("value")
  ),
  server = function(input, output) {

    # submit buttons do not have a value of their own,
    # they control when the app accesses values of other widgets.
    # input$num is the value of the number widget.
    output$value <- renderPrint({ input$num })
  }
)
}



