library(shinyanimate)


### Name: addHoverAnim
### Title: Add animation on mouse hover for UI element.
### Aliases: addHoverAnim

### ** Examples

if(interactive()){
library(shiny)
library(shinyanimate)
ui <- fluidPage(
  withAnim(),
    tags$div(id = 'title', h1('HOVER ON ME'))
    )
server <- function(input, output, session){
  observe(addHoverAnim(session, 'title', 'bounce'))
 }
shinyApp(ui, server)
}



