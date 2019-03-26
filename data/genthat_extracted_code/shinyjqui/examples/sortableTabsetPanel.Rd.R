library(shinyjqui)


### Name: sortableTabsetPanel
### Title: Create a tabset panel with sortable tabs
### Aliases: sortableTabsetPanel

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      sortableTabsetPanel(
        id = "tabs",
        tabPanel(title = "A", "AAA"),
        tabPanel(title = "B", "BBB"),
        tabPanel(title = "C", "CCC")
      ),
      verbatimTextOutput("order")
    ),
    server = function(input, output) {
      output$order <- renderPrint({input$tabs_order})
    }
  )
}




