library(shinydashboardPlus)


### Name: dashboardLabel
### Title: AdminLTE2 label
### Aliases: dashboardLabel

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
     dashboardLabel("Label 1", status = "info"),
     dashboardLabel("Label 2", status = "danger", style = "circle"),
     dashboardLabel("Label 3", status = "success", style = "square")
    )
  ),
  server = function(input, output) { }
 )
}




