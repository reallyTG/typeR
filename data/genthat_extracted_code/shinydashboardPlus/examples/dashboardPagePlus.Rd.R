library(shinydashboardPlus)


### Name: dashboardPagePlus
### Title: Dashboard Page with a right sidebar
### Aliases: dashboardPagePlus

### ** Examples

if (interactive()) {
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)

shinyApp(
  ui = dashboardPagePlus(
    header = dashboardHeaderPlus(
     enable_rightsidebar = TRUE,
     rightSidebarIcon = "gears"
    ),
    sidebar = dashboardSidebar(),
    body = dashboardBody(),
    rightsidebar = rightSidebar(),
    title = "DashboardPage"
  ),
  server = function(input, output) { }
)
}



