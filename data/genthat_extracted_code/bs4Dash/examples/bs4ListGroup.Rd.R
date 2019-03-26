library(bs4Dash)


### Name: bs4ListGroup
### Title: BS4 list group for AdminLTE3
### Aliases: bs4ListGroup

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
       bs4ListGroup(
       bs4ListGroupItem(
        type = "basic",
        "Cras justo odio"
       ),
       bs4ListGroupItem(
        type = "basic",
        "Dapibus ac facilisis in"
       ),
       bs4ListGroupItem(
        type = "basic",
        "Morbi leo risus"
       )
      ),
      bs4ListGroup(
       bs4ListGroupItem(
        "Cras justo odio",
        active = TRUE, 
        disabled = FALSE, 
        type = "action",
        src = "http://www.google.fr"
       ),
       bs4ListGroupItem(
        active = FALSE, 
        disabled = FALSE, 
        type = "action",
        "Dapibus ac facilisis in",
        src = "http://www.google.fr"
       ),
       bs4ListGroupItem(
        "Morbi leo risus",
        active = FALSE, 
        disabled = TRUE, 
        type = "action",
        src = "http://www.google.fr"
       )
      ),
      bs4ListGroup(
       bs4ListGroupItem(
        "Donec id elit non mi porta gravida at eget metus. 
        Maecenas sed diam eget risus varius blandit.",
        active = TRUE, 
        disabled = FALSE, 
        type = "heading",
        title = "List group item heading", 
        subtitle = "3 days ago", 
        footer = "Donec id elit non mi porta."
       ),
       bs4ListGroupItem(
        "Donec id elit non mi porta gravida at eget metus. 
        Maecenas sed diam eget risus varius blandit.",
        active = FALSE, 
        disabled = FALSE, 
        type = "heading",
        title = "List group item heading", 
        subtitle = "3 days ago", 
        footer = "Donec id elit non mi porta."
       )
      )
     )
    )
   ),
   server = function(input, output) {}
 )
}




