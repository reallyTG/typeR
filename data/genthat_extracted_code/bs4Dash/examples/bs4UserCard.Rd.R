library(bs4Dash)


### Name: bs4UserCard
### Title: AdminLTE3 widget user card
### Aliases: bs4UserCard

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
      bs4UserCard(
        src = "https://adminlte.io/themes/AdminLTE/dist/img/user1-128x128.jpg",
        status = "info",
        title = "User card type 1",
        subtitle = "a subtitle here",
        elevation = 4,
        "Any content here"
       ),
       bs4UserCard(
        type = 2,
        src = "https://adminlte.io/themes/AdminLTE/dist/img/user7-128x128.jpg",
        status = "success",
        imageElevation = 4,
        title = "User card type 2",
        subtitle = "a subtitle here",
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
       )
      )
     )
   ),
   server = function(input, output) {}
 )
}




