library(ipc)


### Name: AsyncProgress
### Title: A progress bar object where inc and set are usable within other
###   processes
### Aliases: AsyncProgress
### Keywords: datasets

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {
library(shiny)
library(future)
plan(multiprocess)
ui <- fluidPage(
  actionButton("run","Run"),
  tableOutput("dataset")
)

server <- function(input, output, session) {

  dat <- reactiveVal()
  observeEvent(input$run, {
    progress <- AsyncProgress$new(session, min=1, max=15)
    future({
      for (i in 1:15) {
        progress$set(value = i)
        Sys.sleep(0.5)
      }
      progress$close()
      cars
    }) %...>% dat
    NULL
  })

  output$dataset <- renderTable({
    req(dat())
  })
}

shinyApp(ui, server)
}



