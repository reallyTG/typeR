library(shinyjqui)


### Name: selectableTableOutput
### Title: Create a table output element with selectable rows or cells
### Aliases: selectableTableOutput

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      verbatimTextOutput("selected"),
      selectableTableOutput("tbl")
    ),
    server = function(input, output) {
      output$selected <- renderPrint({input$tbl_selected})
      output$tbl <- renderTable(mtcars, rownames = TRUE)
    }
  )
}




