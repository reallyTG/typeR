library(shinyanimate)


### Name: addScrollAnim
### Title: Add animation on scroll for UI element.
### Aliases: addScrollAnim

### ** Examples

if(interactive()){
library(shiny)
library(shinyanimate)
ui <- fluidPage(
  withAnim(),
    tags$h1('Scroll below to see an animation'),
    br(), br(), br(), br(), br(), br(), br(),
    br(), br(), br(), br(), br(), br(), br(),
    br(), br(), br(), br(), br(), br(), br(),
    br(), br(), br(), br(), br(), br(), br(),
    br(), br(), br(), br(), br(), br(), br(),
    br(), br(), br(), br(), br(), br(), br(),
    tags$div(id = 'title', h1('I ANIMATE ON SCROLL'))
    )
server <- function(input, output, session){
  observe(addScrollAnim(session, 'title', 'bounce'))
 }
shinyApp(ui, server)
}



