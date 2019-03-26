library(bs4Dash)


### Name: bs4Jumbotron
### Title: BS4 jumbotron for AdminLTE3
### Aliases: bs4Jumbotron

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
      bs4Jumbotron(
      title = "Hello, world!",
      lead = "This is a simple hero unit, a simple jumbotron-style 
      component for calling extra attention to featured 
      content or information.",
      "It uses utility classes for typography and spacing 
      to space content out within the larger container.",
      status = "primary",
      href = "http://www.google.fr"
      )
     )
   ),
   server = function(input, output) {}
 )
}




