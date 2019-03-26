library(bs4Dash)


### Name: renderbs4ValueBox
### Title: Create a value box (server side)
### Aliases: renderbs4ValueBox renderbs4InfoBox

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
       bs4ValueBoxOutput("vbox"),
       bs4InfoBoxOutput("ibox")
      )
     )
   ),
   server = function(input, output) {
   
     output$vbox <- renderbs4ValueBox({
      bs4ValueBox(
        value = 150,
        subtitle = "New orders",
        status = "primary",
        icon = "shopping-cart",
        href = "#"
       )
    })
    
    output$ibox <- renderbs4InfoBox({
      bs4InfoBox(
       title = "Comments",
       gradientColor = "success",
       value = 41410,
       icon = "comments"
       )
    })
    
   }
 )
}




