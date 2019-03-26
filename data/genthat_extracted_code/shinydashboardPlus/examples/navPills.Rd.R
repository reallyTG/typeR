library(shinydashboardPlus)


### Name: navPills
### Title: AdminLTE2 nav pill container
### Aliases: navPills

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
      title = "Nav Pills",
      status = "info",
      "Box Body",
      footer = navPills(
        navPillsItem(
          pillName = "Item 1", 
          pillColor = "green",
          pillIcon = NULL, 
          pillText = 10
        ),
        navPillsItem(
          pillName = "Item 2", 
          pillColor = "red",
          pillIcon = "fa fa-angle-down", 
          pillText = "10%",
          active = TRUE
        )
      )
     )
    ),
    title = "Nav Pills"
  ),
  server = function(input, output) { }
 )
}




