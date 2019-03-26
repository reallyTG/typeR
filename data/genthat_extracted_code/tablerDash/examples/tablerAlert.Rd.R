library(tablerDash)


### Name: tablerAlert
### Title: Create a Boostrap 4 alert
### Aliases: tablerAlert

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
     tablerAlert(
      title = "Alert",
      "Lorem ipsum dolor sit amet, consectetur
      adipisicing elit. Lorem ipsum dolor sit
      amet, consectetur adipisicing elit.
      Lorem ipsum dolor sit amet, consectetur
      adipisicing elit.",
      icon = "alert-triangle",
      status = "info"
     )
    )
   ),
   server = function(input, output) {}
 )
}




