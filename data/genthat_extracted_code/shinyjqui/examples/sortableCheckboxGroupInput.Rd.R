library(shinyjqui)


### Name: sortableCheckboxGroupInput
### Title: Create a Checkbox Group Input Control with Sortable Choices
### Aliases: sortableCheckboxGroupInput

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      sortableCheckboxGroupInput("foo", "SortableCheckboxGroupInput",
                                 choices = month.abb),
      verbatimTextOutput("order")
    ),
    server = function(input, output) {
      output$order <- renderPrint({input$foo_order})
    }
  )
}




