library(shinyjqui)


### Name: sortableRadioButtons
### Title: Create radio buttons with sortable choices
### Aliases: sortableRadioButtons

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      sortableRadioButtons("foo", "SortableRadioButtons",
                                 choices = month.abb),
      verbatimTextOutput("order")
    ),
    server = function(input, output) {
      output$order <- renderPrint({input$foo_order})
    }
  )
}




