library(plainview)


### Name: plainViewOutput
### Title: Widget output/render function for use in Shiny
### Aliases: plainViewOutput renderPlainView

### ** Examples

if (interactive()) {
  library(shiny)

  plt = plainView(poppendorf[[4]])

  ui = fluidPage(
    plainViewOutput("plot")
  )

  server = function(input, output, session) {
    output$plot <- renderPlainView(plt)
  }

  shinyApp(ui, server)

}




