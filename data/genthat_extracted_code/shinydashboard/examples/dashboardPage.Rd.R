library(shinydashboard)


### Name: dashboardPage
### Title: Dashboard page
### Aliases: dashboardPage

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
# Basic dashboard page template
library(shiny)
shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(),
    title = "Dashboard example"
  ),
  server = function(input, output) { }
)
}



