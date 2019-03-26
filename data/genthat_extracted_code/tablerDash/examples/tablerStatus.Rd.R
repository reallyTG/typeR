library(tablerDash)


### Name: tablerStatus
### Title: Create a Boostrap 4 status
### Aliases: tablerStatus

### ** Examples

if(interactive()){
 library(shiny)
 library(tablerDash)

 shiny::shinyApp(
   ui = tablerDashPage(
    navbar = NULL,
    footer = NULL,
    title = "test",
    body = tablerDashBody(
     tablerStatus(color = "lime")
    )
   ),
   server = function(input, output) {}
 )
}




