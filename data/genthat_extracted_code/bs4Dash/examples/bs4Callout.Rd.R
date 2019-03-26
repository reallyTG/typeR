library(bs4Dash)


### Name: bs4Callout
### Title: Create a Bootstrap 4 callout
### Aliases: bs4Callout

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
       title = "Callouts",
       bs4Callout(
        title = "I am a danger callout!",
        elevation = 4,
        status = "danger",
        "There is a problem that we need to fix. 
        A wonderful serenity has taken possession of 
        my entire soul, like these sweet mornings of 
        spring which I enjoy with my whole heart."
       ),
       bs4Callout(
        title = "I am a danger callout!",
        status = "warning",
        "This is a yellow callout."
       )
     )
   ),
   server = function(input, output) {}
 )
}




