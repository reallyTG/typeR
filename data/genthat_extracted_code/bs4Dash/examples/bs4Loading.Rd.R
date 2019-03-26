library(bs4Dash)


### Name: bs4Loading
### Title: AdminLTE3 loading state element
### Aliases: bs4Loading

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
       title = "Callouts",
       bs4Card(
        title = "Loading State",
        bs4Loading()
       )
     )
   ),
   server = function(input, output) {}
 )
}




