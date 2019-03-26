library(bs4Dash)


### Name: ionicon
### Title: BS4 ionicons
### Aliases: ionicon

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
      ionicon(name ="heart"),
      ionicon(name ="beer")
    )
   ),
   server = function(input, output) {}
 )
}




