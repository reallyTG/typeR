library(bs4Dash)


### Name: bs4Badge
### Title: Create a Bootstrap 4 dashboard badge item
### Aliases: bs4Badge

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
      bs4Badge(
       position = "right",
       status = "warning",
       "Warning"
      )
     )
   ),
   server = function(input, output) {}
 )
}




