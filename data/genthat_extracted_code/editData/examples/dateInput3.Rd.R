library(editData)


### Name: dateInput3
### Title: Create a side-by-side dateInput
### Aliases: dateInput3

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
  ui <- fluidPage(
         label3("Welcome"),
         dateInput3("date", "date"),
         verbatimTextOutput("value")
  )
  server <- function(input, output) {
        output$value <- renderText({ input$date })
  }
  shinyApp(ui, server)
}



