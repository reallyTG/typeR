library(tablerDash)


### Name: tablerProgress
### Title: Create a Boostrap 4 progress bar
### Aliases: tablerProgress

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
      tablerProgress(value = 10, size = "xs"),
      tablerProgress(value = 90, status = "red", size = "sm")
     )
   ),
   server = function(input, output) {}
 )
}




