library(bs4Dash)


### Name: bs4DashPage
### Title: Create a Boostrap 4 dashboard page
### Aliases: bs4DashPage

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
    body = bs4DashBody()
   ),
   server = function(input, output) {}
 )
}




