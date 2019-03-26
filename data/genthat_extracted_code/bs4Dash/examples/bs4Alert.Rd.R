library(bs4Dash)


### Name: bs4Alert
### Title: Create a Bootstrap 4 alert
### Aliases: bs4Alert

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
       title = "Alerts",
       bs4Alert(
        title = "Be Careful!",
        status = "danger",
        closable = FALSE,
        "Danger alert preview. This alert is not dismissable. 
        A wonderful serenity has taken possession of my entire soul, 
        like these sweet mornings of spring which 
        I enjoy with my whole heart."
       ),
       bs4Alert(
        title = "Congratulation!",
        status = "success",
        closable = TRUE,
        elevation = 4,
        "Warning alert preview. This alert is dismissable. 
        A wonderful serenity has taken possession of my entire soul, 
        like these sweet mornings of spring which 
        I enjoy with my whole heart."
       )
     )
   ),
   server = function(input, output) {}
 )
}




