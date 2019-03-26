library(shinydashboardPlus)


### Name: widgetUserBox
### Title: AdminLTE2 widget user box
### Aliases: widgetUserBox

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
     widgetUserBox(
      title = "Nadia Carmichael",
      subtitle = "lead Developer",
      type = 2,
      src = "https://adminlte.io/themes/AdminLTE/dist/img/user7-128x128.jpg",
      color = "yellow",
      "Some text here!",
      footer = "The footer here!"
     ),
     widgetUserBox(
      title = "Alexander Pierce",
      subtitle = "Founder & CEO",
      type = NULL,
      src = "https://adminlte.io/themes/AdminLTE/dist/img/user1-128x128.jpg",
      color = "aqua-active",
      closable = TRUE,
      "Some text here!",
      footer = "The footer here!"
     ),
     widgetUserBox(
      title = "Elizabeth Pierce",
      subtitle = "Web Designer",
      type = NULL,
      src = "https://adminlte.io/themes/AdminLTE/dist/img/user3-128x128.jpg",
      background = TRUE,
      backgroundUrl = "https://www.planwallpaper.com/static/images/744081-background-wallpaper.jpg",
      closable = TRUE,
      "Some text here!",
      footer = "The footer here!"
     )
    ),
    title = "widgetUserBox"
  ),
  server = function(input, output) { }
 )
}




