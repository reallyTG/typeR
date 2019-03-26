library(shiny)


### Name: titlePanel
### Title: Create a panel containing an application title.
### Aliases: titlePanel

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  titlePanel("Hello Shiny!")
)
shinyApp(ui, server = function(input, output) { })
}



