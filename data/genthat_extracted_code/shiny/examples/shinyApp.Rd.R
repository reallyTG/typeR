library(shiny)


### Name: shinyApp
### Title: Create a Shiny app object
### Aliases: shinyApp shinyAppDir shinyAppFile as.shiny.appobj
###   as.shiny.appobj.shiny.appobj as.shiny.appobj.list
###   as.shiny.appobj.character is.shiny.appobj print.shiny.appobj
###   as.tags.shiny.appobj

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  options(device.ask.default = FALSE)

  shinyApp(
    ui = fluidPage(
      numericInput("n", "n", 1),
      plotOutput("plot")
    ),
    server = function(input, output) {
      output$plot <- renderPlot( plot(head(cars, input$n)) )
    }
  )

  shinyAppDir(system.file("examples/01_hello", package="shiny"))


  # The object can be passed to runApp()
  app <- shinyApp(
    ui = fluidPage(
      numericInput("n", "n", 1),
      plotOutput("plot")
    ),
    server = function(input, output) {
      output$plot <- renderPlot( plot(head(cars, input$n)) )
    }
  )

  runApp(app)
}



