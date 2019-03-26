library(pushbar)


### Name: pushbar
### Title: Setup Pushbar
### Aliases: pushbar pushbar_deps setup_pushbar

### ** Examples

library(shiny)

ui <- fluidPage(
  pushbar_deps(),
  actionButton("open", "Open pushbar"),
  pushbar(
    h4("HELLO")
  )
)

server <- function(input, output, session){

  setup_pushbar()
 
  observeEvent(input$open, {
    pushbar_open()
  })  
}

if(interactive()) shinyApp(ui, server)




