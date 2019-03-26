library(bs4Dash)


### Name: bs4ProgressBar
### Title: Create a Bootstrap 4 progress bar
### Aliases: bs4ProgressBar

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
       bs4Card(
        title = "Progress bars",
        footer = tagList(
          bs4ProgressBar(
          value = 5,
          striped = FALSE,
          status = "info"
         ),
         bs4ProgressBar(
          value = 5,
          striped = TRUE,
          status = "warning",
          width = "20%"
         )
        ),
        bs4ProgressBar(
         value = 80,
         vertical = TRUE,
         status = "success"
        ),
        bs4ProgressBar(
         value = 100,
         vertical = TRUE,
         striped = TRUE,
         status = "danger",
         height = "80%"
        )
       )
     )
   ),
   server = function(input, output) {}
 )
}




