library(editData)


### Name: textInput3
### Title: Create a side-by-side textInput control for entry of
###   unstructured text values
### Aliases: textInput3

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
  ui <- fluidPage(
         textInput3("id", "id", ""),
         textInput3("name","name","")
    )
    server <- function(input, output) {

    }
    shinyApp(ui, server)
}



