library(shiny)


### Name: updateTabsetPanel
### Title: Change the selected tab on the client
### Aliases: updateTabsetPanel updateNavbarPage updateNavlistPanel

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fluidPage(sidebarLayout(
  sidebarPanel(
    sliderInput("controller", "Controller", 1, 3, 1)
  ),
  mainPanel(
    tabsetPanel(id = "inTabset",
      tabPanel(title = "Panel 1", value = "panel1", "Panel 1 content"),
      tabPanel(title = "Panel 2", value = "panel2", "Panel 2 content"),
      tabPanel(title = "Panel 3", value = "panel3", "Panel 3 content")
    )
  )
))

server <- function(input, output, session) {
  observeEvent(input$controller, {
    updateTabsetPanel(session, "inTabset",
      selected = paste0("panel", input$controller)
    )
  })
}

shinyApp(ui, server)
}



