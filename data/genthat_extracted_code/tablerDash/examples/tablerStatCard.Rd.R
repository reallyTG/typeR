library(tablerDash)


### Name: tablerStatCard
### Title: Create a Boostrap 4 stat card
### Aliases: tablerStatCard

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
     tablerStatCard(
      value = 43,
      title = "Followers",
      trend = -10
     )
    )
   ),
   server = function(input, output) {}
 )
}




