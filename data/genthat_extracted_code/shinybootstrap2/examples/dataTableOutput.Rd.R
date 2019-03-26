library(shinybootstrap2)


### Name: dataTableOutput
### Title: Create a table output element
### Aliases: dataTableOutput

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  library(shiny)
  shinyApp(
    ui = bootstrapPage(
      dataTableOutput('table')
    ),
    server = function(input, output) {
      output$table <- renderDataTable(iris)
    }
  )
}



