library(shiny)


### Name: Progress
### Title: Reporting progress (object-oriented API)
### Aliases: Progress
### Keywords: datasets

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(
  plotOutput("plot")
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    progress <- Progress$new(session, min=1, max=15)
    on.exit(progress$close())

    progress$set(message = 'Calculation in progress',
                 detail = 'This may take a while...')

    for (i in 1:15) {
      progress$set(value = i)
      Sys.sleep(0.5)
    }
    plot(cars)
  })
}

shinyApp(ui, server)
}



