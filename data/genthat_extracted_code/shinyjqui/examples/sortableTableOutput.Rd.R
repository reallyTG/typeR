library(shinyjqui)


### Name: sortableTableOutput
### Title: Create a table output element with sortable rows
### Aliases: sortableTableOutput

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      verbatimTextOutput("rows"),
      sortableTableOutput("tbl")
    ),
    server = function(input, output) {
      output$rows <- renderPrint({input$tbl_row_index})
      output$tbl <- renderTable(mtcars, rownames = TRUE)
    }
  )
}




