library(editData)


### Name: numericInput3
### Title: Create a side-by-side numericInput
### Aliases: numericInput3

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
  ui <- fluidPage(
         textInput3("id", "id", ""),
         numericInput3("score","score",value=1)
    )
    server <- function(input, output) {

    }
    shinyApp(ui, server)
}



