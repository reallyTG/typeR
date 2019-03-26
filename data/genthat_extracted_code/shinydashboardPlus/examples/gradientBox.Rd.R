library(shinydashboardPlus)


### Name: gradientBox
### Title: AdminLTE2 gradient box
### Aliases: gradientBox

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
     gradientBox(
      title = "My gradient Box",
      icon = "fa fa-th",
      gradientColor = "teal", 
      boxToolSize = "sm", 
      footer = sliderInput(
       "obs", 
       "Number of observations:",
        min = 0, max = 1000, value = 500
       ),
      "This is a gradient box"
      ),
      gradientBox(
      title = "My gradient Box",
      icon = "fa fa-heart",
      gradientColor = "maroon", 
      boxToolSize = "xs", 
      closable = TRUE,
      footer = "The footer goes here. You can include anything",
      "This is a gradient box"
      )
    ),
    title = "gradientBox"
  ),
  server = function(input, output) { }
 )
}




