library(shinydashboardPlus)


### Name: loadingState
### Title: AdminLTE2 loading state element
### Aliases: loadingState

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
      title = "loading spinner",
      loadingState()
      )
    ),
    title = "Loading State"
  ),
  server = function(input, output) { }
 )
}




