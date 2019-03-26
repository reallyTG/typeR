library(shinydashboardPlus)


### Name: blockQuote
### Title: AdminLTE2 block quote
### Aliases: blockQuote

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
     box(
      title = "BlockQuote example",
      blockQuote("I quote some text here!")
     )
    ),
    title = "blockQuote"
  ),
  server = function(input, output) { }
 )
}




