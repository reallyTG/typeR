library(editData)


### Name: checkboxInput3
### Title: Create a side-by-side checkboxInput
### Aliases: checkboxInput3

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
  ui <- fluidPage(
         label3("Welcome"),
         checkboxInput3("somevalue", "Some value", FALSE),
         verbatimTextOutput("value")
  )
  server <- function(input, output) {
        output$value <- renderText({ input$somevalue })
  }
  shinyApp(ui, server)
}



