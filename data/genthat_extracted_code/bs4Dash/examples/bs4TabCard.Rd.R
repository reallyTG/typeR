library(bs4Dash)


### Name: bs4TabCard
### Title: Create a Boostrap 4 tabCard
### Aliases: bs4TabCard

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
     bs4TabCard(
      title = "A card with tabs",
      bs4TabPanel(
       tabName = "Tab1", 
       active = FALSE,
       "Content 1"
      ),
      bs4TabPanel(
       tabName = "Tab2", 
       active = TRUE,
       "Content 2"
      ),
      bs4TabPanel(
       tabName = "Tab3", 
       active = FALSE,
       "Content 3"
      )
     )
    )
   ),
   server = function(input, output) {}
 )
}




