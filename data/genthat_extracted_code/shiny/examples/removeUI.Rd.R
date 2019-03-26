library(shiny)


### Name: removeUI
### Title: Remove UI objects
### Aliases: removeUI

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
# Define UI
ui <- fluidPage(
  actionButton("rmv", "Remove UI"),
  textInput("txt", "This is no longer useful")
)

# Server logic
server <- function(input, output, session) {
  observeEvent(input$rmv, {
    removeUI(
      selector = "div:has(> #txt)"
    )
  })
}

# Complete app with UI and server components
shinyApp(ui, server)
}



