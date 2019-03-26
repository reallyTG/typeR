library(dqshiny)


### Name: dq_infobox
### Title: Creates an info box with given texts
### Aliases: dq_infobox

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    init(),
    fluidRow(
      dq_infobox(
      "hello", 2, "world", shiny::icon("hashtag"),
      bgColor = "black", color = "#D00"
      ),
      dq_infobox("hello", "2", href="https://www.google.com"),
      dq_infobox("hello", 2, "world", "YOU", fill=F)
    )
  ),
  server = function(input, output) {
  }
)

}



