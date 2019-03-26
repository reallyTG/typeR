library(bs4Dash)


### Name: bs4InfoBox
### Title: Boostrap 4 info box
### Aliases: bs4InfoBox

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
      fluidRow(
       bs4InfoBox(
        title = "Messages",
        value = 1410,
        icon = "envelope"
       ),
       bs4InfoBox(
        title = "Bookmarks",
        status = "info",
        value = 240,
        icon = "bookmark"
       ),
       bs4InfoBox(
        title = "Comments",
        gradientColor = "danger",
        value = 41410,
        icon = "comments"
       )
      )
     )
   ),
   server = function(input, output) {}
 )
}




