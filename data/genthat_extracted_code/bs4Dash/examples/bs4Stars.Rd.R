library(bs4Dash)


### Name: bs4Stars
### Title: AdminLTE3 stars
### Aliases: bs4Stars

### ** Examples

if(interactive()){
 library(shiny)
 library(bs4Dash)
 
 shiny::shinyApp(
   ui = bs4DashPage(
     navbar = bs4DashNavbar(),
     sidebar = bs4DashSidebar(),
     controlbar = bs4DashControlbar(),
     footer = bs4DashFooter(),
     title = "test",
     body = bs4DashBody(
      bs4Card(
       title = "Stars",
       bs4Stars(grade = 5),
       bs4Stars(grade = 5, status = "success"),
       bs4Stars(grade = 1, status = "danger"),
       bs4Stars(grade = 3, status = "info")
      )
     )
   ),
   server = function(input, output) {}
 )
}




