library(editData)


### Name: radioButtons3
### Title: Create a side-by-side radioButtons
### Aliases: radioButtons3

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
  ui <- fluidPage(
         label3("Welcome"),
         radioButtons3("mydata", "mydata", choices=c("mtcars","iris")),
         verbatimTextOutput("value")
  )
  server <- function(input, output) {
        output$value <- renderText({ input$mydata })
  }
  shinyApp(ui, server)
}



