library(bs4Dash)


### Name: bs4ValueBox
### Title: Boostrap 4 value box
### Aliases: bs4ValueBox

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
       bs4ValueBox(
        value = 150,
        subtitle = "New orders",
        status = "primary",
        icon = "shopping-cart",
        href = "#"
       ),
       bs4ValueBox(
        value = "53%",
        subtitle = "New orders",
        status = "danger",
        icon = "cogs"
       ),
       bs4ValueBox(
        value = "44",
        subtitle = "User Registrations",
        status = "warning",
        icon = "sliders"
       )
      )
     )
   ),
   server = function(input, output) {}
 )
}




