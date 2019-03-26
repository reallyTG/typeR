library(bs4Dash)


### Name: bs4Carousel
### Title: Create a Bootstrap 4 carousel
### Aliases: bs4Carousel

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
      title = "Carousel",
      bs4Carousel(
       id = "mycarousel",
       width = 6,
       bs4CarouselItem(
        active = TRUE,
        src = "http://placehold.it/900x500/39CCCC/ffffff&text=I+Love+Bootstrap"
       ),
       bs4CarouselItem(
        active = FALSE,
        src = "http://placehold.it/900x500/3c8dbc/ffffff&text=I+Love+Bootstrap"
       ),
       bs4CarouselItem(
        active = FALSE,
        src = "http://placehold.it/900x500/f39c12/ffffff&text=I+Love+Bootstrap"
       )
     )
    )
   ),
   server = function(input, output) {}
 )
}




