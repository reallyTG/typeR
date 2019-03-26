library(shinydashboardPlus)


### Name: verticalProgress
### Title: AdminLTE2 vertical progress bar
### Aliases: verticalProgress

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 shinyApp(
   ui = dashboardPagePlus(
     header = dashboardHeaderPlus(
      enable_rightsidebar = TRUE,
      rightSidebarIcon = "gears"
     ),
     sidebar = dashboardSidebar(),
     body = dashboardBody(
      verticalProgress(
       value = 10,
       striped = TRUE,
       active = TRUE
      ),
      verticalProgress(
       value = 50,
       active = TRUE,
       status = "warning",
       size = "xs"
      ),
      verticalProgress(
       value = 20,
       status = "danger",
       size = "sm",
       height = "60%"
      )
     ),
     rightsidebar = rightSidebar(),
     title = "Right Sidebar"
   ),
   server = function(input, output) { }
 )
}



