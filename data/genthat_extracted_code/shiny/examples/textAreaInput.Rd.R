library(shiny)


### Name: textAreaInput
### Title: Create a textarea input control
### Aliases: textAreaInput

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  textAreaInput("caption", "Caption", "Data Summary", width = "1000px"),
  verbatimTextOutput("value")
)
server <- function(input, output) {
  output$value <- renderText({ input$caption })
}
shinyApp(ui, server)

}



