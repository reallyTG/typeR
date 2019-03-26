library(tablerDash)


### Name: tablerInfoCard
### Title: Create a Boostrap 4 info card
### Aliases: tablerInfoCard

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
     tablerInfoCard(
      value = "132 sales",
      status = "danger",
      icon = "dollar-sign",
      description = "12 waiting payments"
     )
    )
   ),
   server = function(input, output) {}
 )
}




