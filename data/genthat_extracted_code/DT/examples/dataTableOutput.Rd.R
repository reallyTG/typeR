library(DT)


### Name: dataTableOutput
### Title: Helper functions for using DT in Shiny
### Aliases: dataTableOutput DTOutput renderDataTable renderDT

### ** Examples

if (interactive()) {
  library(shiny)
  library(DT)
  shinyApp(
    ui = fluidPage(fluidRow(column(12, DTOutput('tbl')))),
    server = function(input, output) {
      output$tbl = renderDT(
        iris, options = list(lengthChange = FALSE)
      )
    }
  )
}



