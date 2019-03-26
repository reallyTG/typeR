library(tablerDash)


### Name: tablerCard
### Title: Create a Boostrap 4 card
### Aliases: tablerCard

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
     tablerCard(
      title = "Card",
      sliderInput("obs", "Number of observations:",
      min = 0, max = 1000, value = 500
      ),
      plotOutput("distPlot"),
      status = "success",
      statusSide = "left"
     )
    )
   ),
   server = function(input, output) {
   output$distPlot <- renderPlot({
    hist(rnorm(input$obs))
   })
  }
 )
}




