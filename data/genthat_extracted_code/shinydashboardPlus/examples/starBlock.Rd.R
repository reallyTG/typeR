library(shinydashboardPlus)


### Name: starBlock
### Title: AdminLTE2 starBlock
### Aliases: starBlock

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
      title = "Star example",
      starBlock(grade = 5),
      starBlock(grade = 5, color = "olive"),
      starBlock(grade = 1, color = "maroon"),
      starBlock(grade = 3, color = "teal")
     )
    ),
    title = "starBlock"
  ),
  server = function(input, output) { }
 )
}




