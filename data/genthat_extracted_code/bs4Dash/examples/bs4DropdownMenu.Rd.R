library(bs4Dash)


### Name: bs4DropdownMenu
### Title: Create a Boostrap 4 dashboard dropdown menu
### Aliases: bs4DropdownMenu

### ** Examples

if(interactive()){
 library(shiny)
 library(bs4Dash)
 
 shiny::shinyApp(
   ui = bs4DashPage(
     navbar = bs4DashNavbar(
      rightUi = bs4DropdownMenu(
       show = TRUE,
       labelText = "!",
       status = "danger",
       src = "http://www.google.fr",
       bs4DropdownMenuItem(
        text = "message 1",
        date = "today"
       ),
       bs4DropdownMenuItem(
        text = "message 2",
        date = "yesterday"
       )
      )
     ),
     sidebar = bs4DashSidebar(),
     controlbar = bs4DashControlbar(),
     footer = bs4DashFooter(),
     title = "test",
     body = bs4DashBody()
   ),
   server = function(input, output) {}
 )
}




