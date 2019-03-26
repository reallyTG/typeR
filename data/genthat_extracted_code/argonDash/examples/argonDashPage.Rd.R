library(argonDash)


### Name: argonDashPage
### Title: Create a Boostrap 4 dashboard page
### Aliases: argonDashPage

### ** Examples

if(interactive()){
 library(shiny)
 library(argonDash)

 shiny::shinyApp(
   ui = argonDashPage(),
   server = function(input, output) {}
 )
}




