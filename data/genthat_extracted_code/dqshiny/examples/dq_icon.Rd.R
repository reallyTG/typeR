library(dqshiny)


### Name: dq_icon
### Title: Creates an icon element
### Aliases: dq_icon

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
addResourcePath("images", system.file("www", "img", package = "dqutils"))
shinyApp(
  ui = fluidPage(
    dq_icon("table", size = "4x"),
    dq_icon("check", color = "red", lib = "glyphicon", size = "2x"),
    dq_icon("phone", bg_color = "green", size = "lg"),
    dq_icon("images/logo_daqana.svg", size = "3x")
  ),
  server = function(input, output, session) {}
)

}



