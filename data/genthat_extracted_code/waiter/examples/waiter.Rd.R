library(waiter)


### Name: waiter
### Title: Waiter
### Aliases: waiter use_waiter show_waiter hide_waiter

### ** Examples

library(shiny)

ui <- fluidPage(
  use_waiter(),
  actionButton("show", "Show loading for 5 seconds")
)

server <- function(input, output, session){
  observeEvent(input$show, {
    show_waiter(
      tagList(
        spin_fading_circles(),
        "Loading ..."
      )
    )
    Sys.sleep(3)
    hide_waiter()
  })
}

if(interactive()) shinyApp(ui, server)




