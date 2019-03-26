library(tablerDash)


### Name: tablerDashPage
### Title: Create a Boostrap 4 dashboard page
### Aliases: tablerDashPage

### ** Examples

if(interactive()){
 library(shiny)
 library(tablerDash)

 shiny::shinyApp(
   ui = tablerDashPage(
    navbar = tablerDashNav(),
    footer = tablerDashFooter(),
    title = "test",
    body = tablerDashBody()
   ),
   server = function(input, output) {}
 )
}




