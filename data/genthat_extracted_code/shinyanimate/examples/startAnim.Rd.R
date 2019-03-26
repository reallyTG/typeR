library(shinyanimate)


### Name: startAnim
### Title: Start an animation
### Aliases: startAnim

### ** Examples

if(interactive()){
library(shiny)
library(shinyanimate)
ui <- fluidPage(
 withAnim(),
 tags$div(id = 'title', h1('ANIMATION')),
 actionButton(inputId = "button", label = "Animate")
)
server <- function(input, output, session){
 observeEvent(input$button,{
   startAnim(session, 'title', 'bounce')
 })
}
shinyApp(ui, server)
}



