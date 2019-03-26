library(shinydashboardPlus)


### Name: socialButton
### Title: AdminLTE2 social button
### Aliases: socialButton

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
      title = "Social Buttons",
      status = NULL,
      socialButton(
        url = "http://dropbox.com",
        type = "dropbox"
      ),
      socialButton(
        url = "http://github.com",
        type = "github"
      )
     )
    ),
    title = "Social Buttons"
  ),
  server = function(input, output) { }
 )
}




