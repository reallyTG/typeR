library(dqshiny)


### Name: dq_htmltable
### Title: Create a HTML table containing the given list of elements
### Aliases: dq_htmltable

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    fluidRow(
      column(3, dq_htmltable(list(list("Description", icon("hashtag")),
                             list("Value", textInput("value", NULL)),
                             list("Result", textOutput("result")))),
                             offset = 2, style="background:#ff8f00"
      ),
      column(3, dq_htmltable(list(list("Left", "Center", "Right"),
                             list("Center", "Right", "Left")),
                             align = list(c("left", "center", "right"),
                             c("center", "right", "left"))),
                             offset = 1, style="background:#ff8f00"
      )
    )),
  server = function(input, output) {
    observeEvent(input$value, output$result <- renderText(input$value))
  }
)

}



