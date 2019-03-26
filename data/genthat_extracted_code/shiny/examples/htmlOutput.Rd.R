library(shiny)


### Name: htmlOutput
### Title: Create an HTML output element
### Aliases: htmlOutput uiOutput

### ** Examples

htmlOutput("summary")

# Using a custom container and class
tags$ul(
  htmlOutput("summary", container = tags$li, class = "custom-li-output")
)



